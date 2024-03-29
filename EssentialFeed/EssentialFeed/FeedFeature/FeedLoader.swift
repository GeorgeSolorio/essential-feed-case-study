//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by George Solorio on 2/17/24.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
