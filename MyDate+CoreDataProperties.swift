//
//  MyDate+CoreDataProperties.swift
//  date
//
//  Created by Mohan K on 23/03/23.
//
//

import Foundation
import CoreData


extension MyDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyDate> {
        return NSFetchRequest<MyDate>(entityName: "MyDate")
    }

    @NSManaged public var date: Date?
    @NSManaged public var text: String?
    @NSManaged public var dateString: String?
}

extension MyDate : Identifiable {

}
