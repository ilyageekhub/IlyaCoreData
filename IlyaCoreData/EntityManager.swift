//
//  EntityManager.swift
//  IlyaCoreData
//
//  Created by Admin on 23.12.2019.
//  Copyright © 2019 Ilya Ilushenko. All rights reserved.
//

import CoreData

class EntityManager {
    static let shared = EntityManager()
    private init () {}

    func createStudent (name: String, birthday: Date?) -> Student? {
        let context = CoreDataManager.shared.getContext()
        if let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as? Student {
            student.name = name
            student.birthday = birthday
            CoreDataManager.shared.saveContext()
            return student
        }
        return nil
    }

    func createTeacher (name: String, birthday: Date?) -> Teacher? {
        let context = CoreDataManager.shared.getContext()
        if let teacher = NSEntityDescription.insertNewObject(forEntityName: "Teacher", into: context) as? Teacher {
            teacher.name = name
            teacher.birthday = birthday
            CoreDataManager.shared.saveContext()
            return teacher
        }
        return nil
    }

    func createGroup (name: String) -> Group? {
        let context = CoreDataManager.shared.getContext()
        if let group = NSEntityDescription.insertNewObject(forEntityName: "Group", into: context) as? Group {
            group.name = name
            CoreDataManager.shared.saveContext()
            return group
        }
        return nil
    }

    func createProject (topic: String) -> Project? {
        let context = CoreDataManager.shared.getContext()
        if let project = NSEntityDescription.insertNewObject(forEntityName: "Project", into: context) as? Project {
            project.topic = topic
            CoreDataManager.shared.saveContext()
            return project
        }
        return nil
    }
}

extension Student {
    func  setProject (project: Project?) {
        self.project = project
        CoreDataManager.shared.saveContext()
    }
}
