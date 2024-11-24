//
//  Order.swift
//  TrackBites
//
//  Created by Sebastian-Alexandru Popa on 23.11.2024.
//

import Foundation
import SwiftData

@Model
class Order {
    @Attribute(.unique) var id: UUID
    @Relationship var onlinePlatform: OnlinePlatform
    var restaurantName: String
    var items: [OrderItem]
    var deliveryFee: Cost?
    var operationalFee: Cost?
    var otherFees: Cost?
    var date: Date
    var totalCost: Cost {
        guard items.allSatisfy({ item in
            item.price.currency == items.first?.price.currency
        }), let currency = items.first?.price.currency else {
            return Cost(value: -1, currency: "N/A")
        }
        
        var costOfItems: Cost = Cost(value: 0, currency: currency)
        
        for item in items {
            if let sum = costOfItems + item.price {
                costOfItems = sum
            } else {
                return Cost(value: -1, currency: "N/A")
            }
        }

        let finalDeliveryFee = deliveryFee ?? Cost(value: 0, currency: currency)
        let finalOperationalFee = operationalFee ?? Cost(value: 0, currency: currency)
        let finalOtherFees = otherFees ?? Cost(value: 0, currency: currency)
        
        guard let sumOfAllFees = (finalDeliveryFee + finalOtherFees) ?? Cost(value: 0, currency: currency) + finalOperationalFee else {
            return Cost(value: -1, currency: "N/A")
        }
        
        guard let totalDeliveryFee = finalDeliveryFee + sumOfAllFees else {
            return Cost(value: -1, currency: "N/A")
        }
        
        return totalDeliveryFee
    }
    
    init(onlinePlatform: OnlinePlatform, restaurantName: String, items: [OrderItem], deliveryFee: Cost?, operationalFee: Cost?, otherFees: Cost? = nil, date: Date) {
        self.id = UUID()
        self.onlinePlatform = onlinePlatform
        self.restaurantName = restaurantName
        self.items = items
        self.deliveryFee = deliveryFee
        self.operationalFee = operationalFee
        self.otherFees = otherFees
        self.date = date
    }
    
    static let mockOrders: [Order] = [
        Order(
            onlinePlatform: OnlinePlatform.mockPlatforms[0],
            restaurantName: "La Pizza",
            items: [
                OrderItem(name: "Cheeseburger", price: Cost(value: 12.99, currency: "RON"), productDescription: "Juicy cheeseburger with extra cheese", portionSize: PortionSize(value: 150, unitOfMeasurement: UnitMass.grams.symbol), calories: 500),
                OrderItem(name: "Fries", price: Cost(value: 6.99, currency: "RON"), productDescription: "Crispy golden fries", portionSize: PortionSize(value: 200, unitOfMeasurement: UnitMass.grams.symbol), calories: 400)
            ],
            deliveryFee: Cost(value: 10, currency: "RON"),
            operationalFee: Cost(value: 5, currency: "RON"),
            otherFees: Cost(value: 2, currency: "RON"),
            date: Date(timeIntervalSinceNow: -86400 * 3)
        ),
        Order(
            onlinePlatform: OnlinePlatform.mockPlatforms[1],
            restaurantName: "Sushi Bar",
            items: [
                OrderItem(name: "Coke", price: Cost(value: 5.50, currency: "RON"), productDescription: "330ml can of Coca-Cola", calories: 150),
                OrderItem(name: "Sushi Roll", price: Cost(value: 24.99, currency: "RON"), productDescription: "Fresh salmon sushi roll", portionSize: PortionSize(value: 250, unitOfMeasurement: UnitMass.grams.symbol), calories: 350)
            ],
            deliveryFee: Cost(value: 15, currency: "RON"),
            operationalFee: Cost(value: 3, currency: "RON"),
            otherFees: nil,
            date: Date(timeIntervalSinceNow: -86400 * 2)
        ),
        Order(
            onlinePlatform: OnlinePlatform.mockPlatforms[2],
            restaurantName: "Grill House",
            items: [
                OrderItem(name: "Steak", price: Cost(value: 45.00, currency: "RON"), productDescription: "Grilled rib-eye steak", portionSize: PortionSize(value: 300, unitOfMeasurement: UnitMass.grams.symbol), calories: 700),
                OrderItem(name: "Fries", price: Cost(value: 6.99, currency: "RON"), productDescription: "Crispy golden fries", portionSize: PortionSize(value: 200, unitOfMeasurement: UnitMass.grams.symbol), calories: 400)
            ],
            deliveryFee: nil,
            operationalFee: Cost(value: 6, currency: "RON"),
            otherFees: Cost(value: 1.5, currency: "RON"),
            date: Date(timeIntervalSinceNow: -86400 * 1)
        ),
        Order(
            onlinePlatform: OnlinePlatform.mockPlatforms[3],
            restaurantName: "Pasta Paradise",
            items: [
                OrderItem(name: "Pasta Carbonara", price: Cost(value: 18.00, currency: "RON"), productDescription: "Creamy carbonara pasta", portionSize: PortionSize(value: 250, unitOfMeasurement: UnitMass.grams.symbol), calories: 600),
                OrderItem(name: "Garlic Bread", price: Cost(value: 5.00, currency: "RON"), productDescription: "Crispy garlic bread", portionSize: PortionSize(value: 100, unitOfMeasurement: UnitMass.grams.symbol), calories: 300)
            ],
            deliveryFee: Cost(value: 8, currency: "RON"),
            operationalFee: Cost(value: 4, currency: "RON"),
            otherFees: nil,
            date: Date()
        ),
        Order(
            onlinePlatform: OnlinePlatform.mockPlatforms[4],
            restaurantName: "Burger Haven",
            items: [
                OrderItem(name: "Cheeseburger", price: Cost(value: 12.99, currency: "RON"), productDescription: "Juicy cheeseburger with extra cheese", portionSize: PortionSize(value: 150, unitOfMeasurement: UnitMass.grams.symbol), calories: 500),
                OrderItem(name: "Sushi Roll", price: Cost(value: 24.99, currency: "RON"), productDescription: "Fresh salmon sushi roll", portionSize: PortionSize(value: 250, unitOfMeasurement: UnitMass.grams.symbol), calories: 350),
                OrderItem(name: "Coke", price: Cost(value: 5.50, currency: "RON"), productDescription: "330ml can of Coca-Cola", calories: 150)
            ],
            deliveryFee: Cost(value: 12, currency: "RON"),
            operationalFee: nil,
            otherFees: Cost(value: 3, currency: "RON"),
            date: Date(timeIntervalSinceNow: -86400 * 7)
        )
    ]
}
