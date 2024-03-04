//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by George Solorio on 3/3/24.
//

import XCTest

class LocalFeedStore {
    init(store: FeedStore) {
        
    }
}

class FeedStore {
    var deleteCachedFeedCallCount = 0
}

class CacheFeedUseCaseTests: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        
        let store = FeedStore()
        _ = LocalFeedStore(store: store)
        
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
    
}
