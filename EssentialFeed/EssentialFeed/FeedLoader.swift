//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by George Solorio on 6/7/25.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
