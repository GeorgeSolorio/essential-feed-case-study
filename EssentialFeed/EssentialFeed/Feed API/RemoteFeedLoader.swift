//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by George Solorio on 6/11/25.
//

import Foundation

public class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public typealias Result = LoadFeedResult<Error>
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion:  @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case let .success(data, response):
                let result = FeedItemsMapper.map(data, from: response)
                completion(result)
            case .failure:
                completion(.failure(Error.connectivity))
            }
        }
    }
}
