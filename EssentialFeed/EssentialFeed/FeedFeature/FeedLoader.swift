//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by George Solorio on 2/17/24.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
