//
//  CoreDataFeedStoreTests.swift
//  EssentialFeedTests
//
//  Created by George Solorio on 3/25/24.
//

import XCTest
import EssentialFeed

class CoreDataFeedStoreTests: XCTestCase, FeedStoreSpecs {
    func test_retrieve_deliversEmptyOnEmptyCache() throws {
        let sut = try makeSUT()
        
        assertRetrieveDeliversEmptyOnEmptyCache(on: sut)
    }
    
    func test_retrieve_hasNoSideEffectsOnEmptyCache() throws {
        let sut = try makeSUT()
        
        assertRetrieveHasNoSideEffectsOnEmptyCache(on: sut)
    }
    
    func test_retrieve_deliversFoundValuesOnNonEmptyCache() throws {
        let sut = try makeSUT()
        
        assertRetrieveDeliversFoundValuesOnNonEmptyCache(on: sut)
    }
    
    func test_retrieve_hasNoSideEffectsOnNonEmptyCache() throws {
        let sut = try makeSUT()
        
        assertRetrieveHasNoSideEffectsOnNonEmptyCache(on: sut)
    }
    
    func test_insert_deliversNoErrorOnEmptyCache() throws {
        let sut = try makeSUT()
        
        assertInsertDeliversNoErrorOnEmptyCache(on: sut)
    }
    
    func test_insert_deliversNoErrorOnNonEmptyCache() throws {
        let sut = try makeSUT()
        
        assertInsertDeliversNoErrorOnNonEmptyCache(on: sut)
    }
    
    func test_insert_overridesPreviouslyInsertedCacheValues() throws {
        let sut = try makeSUT()
        
        assertInsertOverridesPreviouslyInsertedCacheValues(on: sut)
    }
    
    func test_delete_deliversNoErrorOnEmptyCache() throws {
        let sut = try makeSUT()
        
        assertDeleteDeliversNoErrorOnEmptyCache(on: sut)
    }
    
    func test_delete_deliversNoErrorOnNonEmptyCache() throws {
        let sut = try makeSUT()
        
        assertDeleteDeliversNoErrorOnNonEmptyCache(on: sut)
    }
    
    func test_delete_hasNoSideEffectsOnEmptyCache() throws {
        let sut = try makeSUT()
        
        assertDeleteHasNoSideEffectsOnEmptyCache(on: sut)
    }
    
    func test_delete_emptiesPreviosulyInsertedCache() throws {
        let sut = try makeSUT()
        
        assertDeleteEmptiesPreviosulyInsertedCache(on: sut)
    }
    
    func test_storeSideEffects_runSerially() throws {
        let sut = try makeSUT()
        
        assertStoreSideEffectsRunSerially(on: sut)
    }
    
    // MARK: Helper methods
    private func makeSUT() throws -> FeedStore {
        let storeURL = URL(fileURLWithPath: "/dev/null")
        let bundle = Bundle(for: CoreDataFeedStore.self)
        let sut = try CoreDataFeedStore(storeURL: storeURL, bundle: bundle)
        trackForMemoryLeak(sut)
        return sut
    }
}
