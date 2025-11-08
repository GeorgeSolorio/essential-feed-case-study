//
//  URLSessionHTTPClientTest.swift
//  EssentialFeed
//
//  Created by George Solorio on 11/7/25.
//

import XCTest
import EssentialFeed

class URLSessionHTTPClient {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        session.dataTask(with: url) { _, _, error in
            if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
}

class URLSessionHTTPClientTest: XCTestCase {
    
    func test_getFromURL_performsGETRequestWithURL() {
        URLProtocolStub.startInteceptingRequests()

        let url = URL(string: "http://any-url.com")!
        let exp = expectation(description: "Wait for request")
        URLProtocolStub.observeRequests { request in
            XCTAssertEqual(request.url, url)
            XCTAssertEqual(request.httpMethod, "GET")
            exp.fulfill()
        }
       
        URLSessionHTTPClient().get(from: url) { _ in }
        
        wait(for: [exp], timeout: 1.0)
        URLProtocolStub.stopIntercepetingRequests()
    }
    
    func test_getFromURL_failsOnRequestError() {
        URLProtocolStub.startInteceptingRequests()
        let url = URL(string: "http://any-url.com")!
        let expectedError = NSError(domain: "any error", code: 0, userInfo: nil)
        
        URLProtocolStub.stub(data: nil, response: nil, error: expectedError)
        
        let sut = URLSessionHTTPClient()
        
        let exp = expectation(description: "Wait for completion")
        sut.get(from: url) { result in
            switch result {
            case .failure(let receivedError as NSError):
                XCTAssertEqual(expectedError.domain, receivedError.domain)
                XCTAssertEqual(expectedError.code, receivedError.code)
            default:
                XCTFail("Expected failure with error \(expectedError), got \(result) instead")
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1.0)
        URLProtocolStub.stopIntercepetingRequests()
    }
    
    // MARK: - Helpers
    
    private class URLProtocolStub: URLProtocol {
        private static var stub: Stub?
        private static var requestObserver: ((URLRequest) -> Void)?
        
        private struct Stub {
            let data: Data?
            let response: URLResponse?
            let error: Error?
        }
        
        static func observeRequests(observer: @escaping (URLRequest) -> Void) {
            requestObserver = observer
        }
        
        static func stub(data: Data?, response: URLResponse?, error: Error?) {
            URLProtocolStub.stub = Stub(data: data, response: response, error: error)
        }
        
        override class func canInit(with request: URLRequest) -> Bool {
            return true
        }
        
        override class func canonicalRequest(for request: URLRequest) -> URLRequest {
            requestObserver?(request)
            return request
        }
        
        override func startLoading() {
            guard let stub = URLProtocolStub.stub else {
                return
            }
            
            if let data = stub.data {
                client?.urlProtocol(self, didLoad: data)
            }
            
            if let response = stub.response {
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
            
            if let error = stub.error {
                client?.urlProtocol(self, didFailWithError: error)
            }
            
            client?.urlProtocolDidFinishLoading(self)
        }
        
        override func stopLoading() { }
        
        static func startInteceptingRequests() {
            URLProtocol.registerClass(URLProtocolStub.self)
        }
        
        static func stopIntercepetingRequests() {
            URLProtocol.unregisterClass(URLProtocolStub.self)
            stub = nil
            requestObserver = nil
        }
    }
}
