//
//  Student+CoreDataProperties.swift
//  IlyaCoreData
//
//  Created by Admin on 24.12.2019.
//  Copyright © 2019 Ilya Ilushenko. All rights reserved.
//
//

import Foundation
import CoreData

extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var birthday: Date?
    @NSManaged public var name: String?
    @NSManaged public var group: Group?
    @NSManaged public var project: Project?
}
