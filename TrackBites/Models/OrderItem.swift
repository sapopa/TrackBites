//
//  OrderItem.swift
//  TrackBites
//
//  Created by Sebastian-Alexandru Popa on 23.11.2024.
//

import Foundation
import SwiftData

@Model
class OrderItem {
    @Attribute(.unique) var id: UUID
    var name: String
    var price: Cost
    var productDescription: String?
    var portionSize: PortionSize?
    var calories: Double?
    
    init(name: String, price: Cost, productDescription: String? = nil, portionSize: PortionSize? = nil, calories: Double? = nil) {
        self.id = UUID()
        self.name = name
        self.price = price
        self.productDescription = productDescription
        self.portionSize = portionSize
        self.calories = calories
    }
    
    static let mockOrderItems: [OrderItem] = [
        OrderItem(
            name: "Cheeseburger",
            price: Cost(value: 12.99, currency: "RON"),
            productDescription: "Juicy cheeseburger with extra cheese",
            portionSize: PortionSize(value: 150, unitOfMeasurement: UnitMass.grams.symbol),
            calories: 500
        ),
        OrderItem(
            name: "Fries",
            price: Cost(value: 6.99, currency: "RON"),
            productDescription: "Crispy golden fries",
            portionSize: PortionSize(value: 200, unitOfMeasurement: UnitMass.grams.symbol),
            calories: 400
        ),
        OrderItem(
            name: "Coke",
            price: Cost(value: 5.50, currency: "RON"),
            productDescription: "330ml can of Coca-Cola",
            calories: 150
        ),
        OrderItem(
            name: "Chicken Wings",
            price: Cost(value: 19.99, currency: "RON"),
            portionSize: PortionSize(value: 300, unitOfMeasurement: UnitMass.grams.symbol)
        ),
        OrderItem(
            name: "Ice Cream",
            price: Cost(value: 7.50, currency: "RON"),
            calories: 250
        )
    ]
}
