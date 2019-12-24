//
//  CoreDataManager.swift
//  IlyaCoreData
//
//  Created by Admin on 23.12.2019.
//  Copyright © 2019 Ilya Ilushenko. All rights reserved.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private init () {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "IlyaCoreData")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func getContext () -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
