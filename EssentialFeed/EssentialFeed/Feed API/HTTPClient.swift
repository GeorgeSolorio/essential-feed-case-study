//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by George Solorio on 11/6/25.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}
