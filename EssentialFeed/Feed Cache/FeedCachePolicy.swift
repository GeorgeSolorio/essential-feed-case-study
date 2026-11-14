//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by George Solorio on 10/25/26.
//

import Foundation

struct FeedCachePolicy {
    private static let calendar = Calendar(identifier: .gregorian)
    private static let maxCacheAgeInDays = 7
    
    private init() { }
    
    static func validate(_ timestamp: Date, againts date: Date) -> Bool {
        guard let maxCacheAge = calendar.date(byAdding: .day, value: maxCacheAgeInDays, to: timestamp) else { return false
        }
        return date < maxCacheAge
    }
}
