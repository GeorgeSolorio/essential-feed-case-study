//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by George Solorio on 2/17/24.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}