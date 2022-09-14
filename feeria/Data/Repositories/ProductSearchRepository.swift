//
//  ProductSearchRepository.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

final class ProductSearchRepository: ProductSearchUseCaseProtocol {

    private var localDataSource: ProductSearchLocalDataSourceProtocol

    public var didUpdateProductSearch: (() -> Void)? {
        didSet {
            self.localDataSource.didUpdateProductSearch = didUpdateProductSearch
        }
    }

    init(localDataSource: ProductSearchLocalDataSourceProtocol) {
        self.localDataSource = localDataSource
    }

    public func getProductSearches() -> [ProductSearchDomain] {
        return localDataSource.getProductSearches()
    }

    public func save(with searchText: String) {
        localDataSource.save(with: searchText)
    }

}
