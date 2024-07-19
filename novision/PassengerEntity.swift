//
//  PassengerEntity.swift
//  novision
//
//  Created by Thabhelo Duve on 7/18/24.
//

import Foundation
import CoreData

@objc(PassengerEntity)
public class PassengerEntity: NSManagedObject {
    @NSManaged public var name: String?
    @NSManaged public var age: Int
    @NSManaged public var heartRate: Double
    @NSManaged public var oxygenSaturation: Double
    @NSManaged public var bloodPressureSystolic: Double
    @NSManaged public var bloodPressureDiastolic: Double
    @NSManaged public var temperature: Double
    @NSManaged public var condition: String?
}

extension PassengerEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PassengerEntity> {
        return NSFetchRequest<PassengerEntity>(entityName: "PassengerEntity")
    }
}
