//
//  FLCoreDataStack.swift
//  FlowList
//
//  Created by Daniel on 1/9/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import CoreData


class FLCoreDataStack {
    
    let managedObjectContext :NSManagedObjectContext!
    private let persistentStoreCoordinator: NSPersistentStoreCoordinator!
    private let model: NSManagedObjectModel!
    private let store: NSPersistentStore?
    
    init() {
        
        let bundle = NSBundle.mainBundle()
        let modelURL = bundle.URLForResource("FLDataModel", withExtension: "momd")!
        
        model = NSManagedObjectModel(contentsOfURL: modelURL)
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
        let documentsURL = applicationDocumentsDirectory()
        let storeURL = documentsURL.URLByAppendingPathComponent("FlowList")
        let options = [NSMigratePersistentStoresAutomaticallyOption: true]
        var error: NSError?
        
        store = persistentStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType,
            configuration: nil,
            URL: storeURL,
            options: options,
            error: &error)
        
        if error != nil {
            println("Error adding persistent store: \(error?.localizedDescription)")
            abort()
        }
        
    }
    
    private func applicationDocumentsDirectory() -> NSURL {
        let fileManager = NSFileManager.defaultManager()
        let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL]
        return urls.first!
    }
    
    func saveContext() {
        var error:NSError?
        
        if managedObjectContext.hasChanges && !managedObjectContext.save(&error) {
            println("Could not save \(error?.localizedDescription), info:\(error?.userInfo)")
        }
    }
}
