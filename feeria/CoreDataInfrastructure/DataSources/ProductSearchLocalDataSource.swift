//
//  ProductSearchLocalDataSource.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

final class ProductSearchLocalDataSource: ProductSearchLocalDataSourceProtocol {

    private let store: PersistenceStore<CDProductSearch>

    var didUpdateProductSearch: (() -> Void)?

    // MARK: - Initializers

    init(store: PersistenceStore<CDProductSearch>) {
        self.store = store
        self.store.configureResultsContoller(limit: 5,
                                             sortDescriptors: CDProductSearch.defaultSortDescriptors)
        self.store.delegate = self
    }

    // MARK: - MovieSearchLocalDataSourceProtocol

    func getProductSearches() -> [ProductSearchDomain] {
        return store.findAll().map { $0.asDomain() }
    }

    func save(with searchText: String) {
        store.saveProductSearch(with: searchText)
    }

}

// MARK: - PersistenceStoreDelegate

extension ProductSearchLocalDataSource: PersistenceStoreDelegate {

    func persistenceStore(willUpdateEntity shouldPrepare: Bool) {}

    func persistenceStore(didUpdateEntity update: Bool) {
        didUpdateProductSearch?()
    }

}
