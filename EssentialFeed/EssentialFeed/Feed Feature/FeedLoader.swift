//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by George Solorio on 9/14/25.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
