//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by George Solorio on 10/11/26.
//

import Foundation

final class FeedItemsMapper {
    static func map(_ data: Data, response: HTTPURLResponse) throws -> [FeedItem] {
        guard response.statusCode == 200, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        return root.items.map({ $0.item })
    }
    
    private struct Root: Decodable {
        let items: [Item]
    }

    private struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL
        
        public var item: FeedItem {
            return FeedItem(id: id, description: description, location: location, imageURL: image)
        }
    }

}
