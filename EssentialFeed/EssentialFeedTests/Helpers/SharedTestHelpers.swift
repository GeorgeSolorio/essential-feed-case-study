//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by George Solorio on 3/16/24.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 1)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}
