//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by George Solorio on 2/18/24.
//

import Foundation


public final class RemoteFeedLoader: FeedLoader {
    private let url: URL
    private let client: HTTPClient
        
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public typealias Result = LoadFeedResult
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            
            switch (result) {
            case .failure:
                completion(.failure(RemoteFeedLoader.Error.connectivity))
            case let .success(data, response):
                let result = RemoteFeedLoader.map(data, from: response)
                completion(result)
            }
        }
    }
    
    private static func map(_ data: Data, from response: HTTPURLResponse) -> Result {
        do {
            let items = try FeedItemsMapper.map(data, response: response)
            return .success(items.toModel())
        } catch {
            return .failure(error)
        }
    }
}

private extension Array where Element == RemoteFeedItem {
    func toModel() -> [FeedImage] {
        return map { FeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.image) }
    }
}
