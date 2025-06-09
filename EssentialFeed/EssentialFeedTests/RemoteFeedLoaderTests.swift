//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by George Solorio on 6/8/25.
//

import XCTest

class RemoteFeedLoader {
    let url: URL
    let client: HTTPClient
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    func load() {
        client.get(from: url)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?

    func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        let url = URL(string: "https://a-given-url.com")!
        _ = RemoteFeedLoader(url: url, client: client)

        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        let url = URL(string: "https://a-given-url.com")!
        let sut = RemoteFeedLoader(url: url, client: client)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
