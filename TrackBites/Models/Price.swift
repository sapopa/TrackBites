//
//  Price.swift
//  TrackBites
//
//  Created by Sebastian-Alexandru Popa on 23.11.2024.
//

import Foundation
import SwiftData

@Model
class Cost {
    @Attribute(.unique) var id: UUID
    var value: Decimal
    var currency: String

    init(value: Decimal, currency: String) {
        self.id = UUID()
        self.value = value
        self.currency = currency
    }

    func formatted() -> String {
        return "\(currency) \(value)"
    }
    
    static func + (lhs: Cost, rhs: Cost) -> Cost? {
        guard lhs.currency == rhs.currency else {
            return nil
        }
        
        let summedValue = lhs.value + rhs.value
        return Cost(value: summedValue, currency: lhs.currency)
    }
}
