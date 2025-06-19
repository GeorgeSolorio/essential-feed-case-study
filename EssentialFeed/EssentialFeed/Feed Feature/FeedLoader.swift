//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by George Solorio on 6/8/25.
//

import Foundation

public enum LoadFeedResult {
	case success([FeedItem])
	case failure(Error)
}

public protocol FeedLoader {
	func load(completion: @escaping (LoadFeedResult) -> Void)
}
