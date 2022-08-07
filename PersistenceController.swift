//
//  Persistence.swift
//  SmartAlarmApp
//
//  Created by Shashwath Dinesh on 8/6/22.
//

import CoreData

class Persistence {
    static let shared = Persistence()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SmartAlarmApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
