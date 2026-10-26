//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by George Solorio on 10/24/26.
//

import Foundation
import EssentialFeed

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    URL(string: "https://any-url.com")!
}
