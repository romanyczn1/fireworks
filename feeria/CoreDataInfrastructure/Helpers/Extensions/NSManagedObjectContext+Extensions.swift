//
//  NSManagedObjectContext+Extensions.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import CoreData

extension NSManagedObjectContext {

    func insertObject<A: NSManagedObject>() -> A where A: Managed {
        guard let obj = NSEntityDescription.insertNewObject(forEntityName: A.entityName, into: self) as? A else {
            fatalError("Wrong object type")
        }
        return obj
    }

    @discardableResult
    func saveOrRollback() -> Bool {
        do {
            try save()
            return true
        } catch {
            rollback()
            return false
        }
    }

    func performChanges(block: @escaping () -> Void) {
        perform {
            block()
            self.saveOrRollback()
        }
    }

    func performChangesAndWait(block: () -> Void) {
        performAndWait {
            block()
            self.saveOrRollback()
        }
    }

}
