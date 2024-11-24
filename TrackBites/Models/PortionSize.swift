//
//  PortionSize.swift
//  TrackBites
//
//  Created by Sebastian-Alexandru Popa on 23.11.2024.
//

import Foundation
import SwiftData

@Model
class PortionSize {
    @Attribute(.unique) var id: UUID
    var value: Double
    var unitOfMeasurement: String
    
    init(value: Double, unitOfMeasurement: String) {
        self.id = UUID()
        self.value = value
        self.unitOfMeasurement = unitOfMeasurement
    }
    
    func formatted() -> String {
        return "\(value) \(unitOfMeasurement)"
    }
}
