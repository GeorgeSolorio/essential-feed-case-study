//
//  RemoteFeedLoaderTests.swift
//  EssentialFeed
//
//  Created by George Solorio on 6/8/25.
//

import Foundation

public struct FeedItem: Equatable {
	let id: UUID
	let description: String?
	let location: String?
	let imageURL: URL
}
