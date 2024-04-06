//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by George Solorio on 2/17/24.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
