//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by George Solorio on 2/25/24.
//

import Foundation

internal final class FeedItemsMapper {
    private struct Root: Decodable {
        let items: [Item]
    }

    internal struct Item: Decodable {
        public let id: UUID
        public let description: String?
        public let location: String?
        public let image: URL
        
        var item: FeedItem {
            FeedItem(id: id, description: description,
                location: location,imageURL: image)
        }
    }
    
    private static let OK_200 = 200

    internal static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [FeedItem] {
        guard response.statusCode == OK_200,
                let root = try? JSONDecoder().decode(Root.self, from: data)
        else { throw RemoteFeedLoader.Error.invalidData }
        
        return root.items.map { $0.item }
    }
}
