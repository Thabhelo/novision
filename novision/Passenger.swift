//
//  Passenger.swift
//  novision
//
//  Created by Thabhelo Duve on 7/18/24.
//

//import Foundation
//import CoreData
//
//@objc(Passenger)
//public class Passenger: NSManagedObject, NSFetchRequestResult {
//    @NSManaged public var name: String
//    @NSManaged public var age: Int
//    @NSManaged public var heartRate: Double
//    @NSManaged public var oxygenSaturation: Double
//    @NSManaged public var bloodPressureSystolic: Double
//    @NSManaged public var bloodPressureDiastolic: Double
//    @NSManaged public var temperature: Double
//    @NSManaged public var condition: String
//
//    convenience init(context: NSManagedObjectContext, name: String, age: Int, heartRate: Double, oxygenSaturation: Double, bloodPressureSystolic: Double, bloodPressureDiastolic: Double, temperature: Double, condition: String) {
//        self.init(context: context)
//        self.name = name
//        self.age = age
//        self.heartRate = heartRate
//        self.oxygenSaturation = oxygenSaturation
//        self.bloodPressureSystolic = bloodPressureSystolic
//        self.bloodPressureDiastolic = bloodPressureDiastolic
//        self.temperature = temperature
//        self.condition = condition
//    }
//}
