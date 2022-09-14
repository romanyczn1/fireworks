//
//  CoreDataStack.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import CoreData

class CoreDataStack: CoreDataStackProtocol {

    public static let shared = CoreDataStack()

    private init() {}

    // MARK: - Private

    lazy var persistentContainer: NSPersistentContainer = {
        let bundle = Bundle(for: CoreDataStack.self)
        guard let url = bundle.url(forResource: Constants.containerName, withExtension: "momd"),
              let model = NSManagedObjectModel(contentsOf: url) else {
            fatalError()
        }

        let container = NSPersistentContainer(name: Constants.containerName, managedObjectModel: model)

//        if !persistentStoreDescriptions.isEmpty {
//            container.persistentStoreDescriptions = persistentStoreDescriptions
//        }

        container.loadPersistentStores { _, error in
            guard error == nil else { fatalError() }
        }
        container.viewContext.mergePolicy = NSMergePolicy.overwrite
        return container
    }()

    // MARK: - Test mockups

    lazy var mockPersistantContainer: NSPersistentContainer = {
        let bundle = Bundle(for: CoreDataStack.self)
        guard let url = bundle.url(forResource: Constants.containerName, withExtension: "momd"),
              let model = NSManagedObjectModel(contentsOf: url) else {
            fatalError()
        }

        let container = NSPersistentContainer(name: Constants.containerName, managedObjectModel: model)
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false

        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (description, error) in

            // Check if the data store is in memory
            precondition( description.type == NSInMemoryStoreType )

            // Check if creating container wrong
            if let error = error {
                fatalError("In memory coordinator creation failed \(error)")
            }
        }
        return container
    }()

    private func isTesting() -> Bool {
        return NSClassFromString("XCTest") != nil
    }

}

// MARK: - Constants

extension CoreDataStack {

    struct Constants {
        static let containerName = "Model"
    }

}
