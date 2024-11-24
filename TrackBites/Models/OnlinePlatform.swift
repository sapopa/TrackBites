//
//  OnlinePlatform.swift
//  TrackBites
//
//  Created by Sebastian-Alexandru Popa on 23.11.2024.
//

import Foundation
import SwiftData

@Model
class OnlinePlatform {
    @Attribute(.unique) var id: UUID
    var name: String
    var subscriptionPrice: Cost?
    var isSubscribed: Bool
    
    @Relationship(deleteRule: .cascade, inverse: \Order.onlinePlatform) var orders: [Order]?

    init(name: String, subscriptionPrice: Cost? = nil, isSubscribed: Bool = false) {
        self.id = UUID()
        self.name = name
        self.subscriptionPrice = subscriptionPrice
        self.isSubscribed = isSubscribed
    }
    
    static let mockPlatforms: [OnlinePlatform] = [
        OnlinePlatform(name: "Tazz", subscriptionPrice: Cost(value: 9.99, currency: "RON"), isSubscribed: true),
        OnlinePlatform(name: "Glovo", subscriptionPrice: Cost(value: 15.00, currency: "RON"), isSubscribed: false),
        OnlinePlatform(name: "Bolt Food", subscriptionPrice: nil, isSubscribed: true),
        OnlinePlatform(name: "Foodpanda", isSubscribed: false), // Missing subscriptionPrice
        OnlinePlatform(name: "Wolt", subscriptionPrice: Cost(value: 12.50, currency: "RON"), isSubscribed: true)
    ]
}
