//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by George Solorio on 9/21/26.
//

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
