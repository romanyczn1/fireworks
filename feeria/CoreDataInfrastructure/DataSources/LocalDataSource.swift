//
//  LocalDataSource.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

final class LocalDataSource: LocalDataSourceProtocol {
    
    private let coreDataStack: CoreDataStackProtocol

    // MARK: - Initializers

    public init() {
        self.coreDataStack = CoreDataStack.shared
    }

    // MARK: - LocalDataSourceProtocol

    func productSearchDataSource() -> ProductSearchLocalDataSourceProtocol {
        let store: PersistenceStore<CDProductSearch> = PersistenceStore(self.coreDataStack.persistentContainer)
        return ProductSearchLocalDataSource(store: store)
    }

}
