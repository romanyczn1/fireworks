//
//  UseCaseProvider.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

class UseCaseProvider: UseCaseProviderProtocol {

    private let localDataSource: LocalDataSourceProtocol
    private let remoteDataSource: RemoteDataSourceProtocol

    public init(localDataSource: LocalDataSourceProtocol,
                remoteDataSource: RemoteDataSourceProtocol) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    func categoryUseCase() -> CategoryUseCaseProtocol {
        let remoteDataSource = self.remoteDataSource.categoryDataSource()
        return CategoryRepository(remoteDataSource: remoteDataSource)
    }

    func cartUseCase() -> CartUseCaseProtocol {
        let remoteDataSource = self.remoteDataSource.cartDataSource()
        return CartRepository(remoteDataSource: remoteDataSource)
    }
    
    func productUseCase() -> ProductUseCaseProtocol {
        let remoteDataSource = self.remoteDataSource.productDataSource()
        return ProductRepository(remoteDataSource: remoteDataSource)
    }
    
    func productSearchUseCase() -> ProductSearchUseCaseProtocol {
        let localDataSource = self.localDataSource.productSearchDataSource()
        return ProductSearchRepository(localDataSource: localDataSource)
    }
}
