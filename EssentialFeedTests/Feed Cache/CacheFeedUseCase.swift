//
//  CacheFeedUseCase.swift
//  EssentialFeedTests
//
//  Created by George Solorio on 10/20/26.
//

import XCTest
import EssentialFeed

class LocalFeedLoader {
    private let store: FeedStore
    
    init(store: FeedStore) {
        self.store = store
    }
    
    func save(_ items: [FeedItem]) {
        store.deleteCachedFeed()
    }
}

class FeedStore {
    var deleteCachedFeedCallcount = 0
    
    func deleteCachedFeed() {
        deleteCachedFeedCallcount += 1
    }
}

class CacheFeedUseCaseTests: XCTestCase {
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        let _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deleteCachedFeedCallcount, 0)
    }
    
    func test_save_requestsCacheDeletion() {
        let store = FeedStore()
        let sut = LocalFeedLoader(store: store)
        let items = [uniqueItem(), uniqueItem()]
        
        sut.save(items)
        
        XCTAssertEqual(store.deleteCachedFeedCallcount, 1)
    }
    
    // MARK: - Helpers
    private func uniqueItem() -> FeedItem {
        return FeedItem(id: UUID(), description: "any description", location: "any location", imageURL: anyURL())
    }
    
    func anyURL() -> URL {
        URL(string: "https://any-url.com")!
    }
}
