//
//  Result.swift
//  BucketList
//
//  Created by Андрей Завадский on 28.03.2025.
//
import SwiftUI

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
