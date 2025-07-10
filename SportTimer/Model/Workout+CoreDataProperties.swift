//
//  Workout+CoreDataProperties.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 10.07.2025.
//
//

import Foundation
import CoreData


extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var id: UUID
    @NSManaged public var type: String
    @NSManaged public var duration: Int32
    @NSManaged public var notes: String?
    @NSManaged public var date: Date

}

extension Workout : Identifiable {

}
