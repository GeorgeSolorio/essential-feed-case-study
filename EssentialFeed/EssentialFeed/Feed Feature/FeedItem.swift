//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by George Solorio on 9/14/25.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
