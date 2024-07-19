//  Models.swift
//  novision
//
//  Created by Thabhelo Duve on 6/16/24.
//

import Foundation
import SwiftData
import CoreData


@Model
class Passenger {
    var name: String
    var age: Int
    var heartRate: Double
    var oxygenSaturation: Double
    var bloodPressureSystolic: Double
    var bloodPressureDiastolic: Double
    var temperature: Double
    var condition: String

    init(name: String, age: Int, heartRate: Double, oxygenSaturation: Double, bloodPressureSystolic: Double, bloodPressureDiastolic: Double, temperature: Double, condition: String) {
        self.name = name
        self.age = age
        self.heartRate = heartRate
        self.oxygenSaturation = oxygenSaturation
        self.bloodPressureSystolic = bloodPressureSystolic
        self.bloodPressureDiastolic = bloodPressureDiastolic
        self.temperature = temperature
        self.condition = condition
    }
}

