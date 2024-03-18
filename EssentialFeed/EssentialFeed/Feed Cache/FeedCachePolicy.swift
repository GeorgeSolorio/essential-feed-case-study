//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by George Solorio on 3/17/24.
//

import Foundation

struct FeedCachePolicy {
    private init() {}
    
    static private let calendar = Calendar(identifier: .gregorian)
    
    static private var maxCacheAgeInDays: Int {
        return 7
    }
    
    static func validate(_ timestamp: Date, againts date: Date) -> Bool {
        guard let maxCacheAge = calendar.date(byAdding: .day, value: maxCacheAgeInDays, to: timestamp) else {
            return false
        }
        
        return date < maxCacheAge
    }
}
