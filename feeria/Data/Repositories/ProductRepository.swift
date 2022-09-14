//
//  ProductRepository.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

public class ProductRepository: ProductUseCaseProtocol {
    
    private var remoteDataSource: ProductRemoteDataSourceProtocol

    init(remoteDataSource: ProductRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getPopularProducts(completion: @escaping (Result<[ProductDomain], Error>) -> Void) {
        remoteDataSource.getPopularProducts(completion: completion)
    }
    
    func getProducts(searchText: String, completion: @escaping (Result<[ProductDomain], Error>) -> Void) {
        remoteDataSource.getProducts(searchText: searchText, completion: completion)
    }
    
    func getProductDetail(for productId: Int, completion: @escaping (Result<ProductDomain, Error>) -> Void) {
        fatalError("not implemented yet")
    }
}
