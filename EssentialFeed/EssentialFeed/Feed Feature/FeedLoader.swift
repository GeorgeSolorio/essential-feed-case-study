//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by George Solorio on 6/8/25.
//

import Foundation

public enum LoadFeedResult<Error: Swift.Error> {
	case success([FeedItem])
	case failure(Error)
}

extension LoadFeedResult: Equatable where Error: Equatable { }

public protocol FeedLoader {
    typealias Error = Swift.Error
	func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
