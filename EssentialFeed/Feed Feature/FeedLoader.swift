//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by George Solorio on 9/21/26.
//

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
