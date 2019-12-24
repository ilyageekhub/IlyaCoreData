//
//  Project+CoreDataProperties.swift
//  IlyaCoreData
//
//  Created by Admin on 24.12.2019.
//  Copyright © 2019 Ilya Ilushenko. All rights reserved.
//
//

import Foundation
import CoreData

extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var topic: String?
    @NSManaged public var student: Student?
}
