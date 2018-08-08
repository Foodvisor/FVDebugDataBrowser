//
//  FVDebugCoredataManager.swift
//  FVDebugDataBrowser
//
//  Created by Fong Zhou on 07/08/2018.
//

import UIKit
import CoreData

// TODO: need to improve this setup
class FVDebugCoredataManager {

    static let instance = FVDebugCoredataManager()

    var container: NSPersistentContainer!
    var context: NSManagedObjectContext!

    var backgroundMergedOperations: [(() -> Void)] = []

    init() {
        // if crash here, then core data is not configured
        container = NSPersistentContainer(name: FVDebugDataBrowser.instance.persistanceContainerName!)
        container.loadPersistentStores { (_, _) in }
        context = container.viewContext
    }

    func fetchEntities() -> [NSEntityDescription] {
        let entities = container.persistentStoreCoordinator.managedObjectModel.entities
        return entities
    }

    func fetchObject(entity: NSEntityDescription) -> [NSManagedObject] {
        guard let name = entity.name else { return [] }

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: name)
        do {
            let objects = try context.fetch(fetchRequest)
            return (objects as? [NSManagedObject]) ?? []
        }
        catch {
            return []
        }
    }

}
