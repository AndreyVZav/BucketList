//
//  Untitled.swift
//  BucketList
//
//  Created by Андрей Завадский on 27.03.2025.
//
import SwiftUI

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
