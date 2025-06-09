//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by George Solorio on 6/8/25.
//

import Foundation

enum LoadFeedResult {
	case success([FeedItem])
	case error(Error)
}

protocol FeedLoader {
	func load(completion: @escaping (LoadFeedResult) -> Void)
}
