//
//  ProductRemoteDataSource.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

final class ProductRemoteDataSource: ProductRemoteDataSourceProtocol {
    
    private let client: ProductClientProtocol

    init(client: ProductClientProtocol) {
        self.client = client
    }
    
    func getPopularProducts(completion: @escaping (Result<[ProductDomain], Error>) -> Void) {
        client.getPopularProducts { result in
            switch result {
            case .success(let productResult):
                guard let productResult = productResult else { return }
                let products = productResult.results.map { $0.asDomain() }
                completion(.success(products))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getProducts(searchText: String, completion: @escaping (Result<[ProductDomain], Error>) -> Void) {
        client.getProducts(searchText: searchText) { result in
            switch result {
            case .success(let productResult):
                guard let productResult = productResult else { return }
                let products = productResult.results.map { $0.asDomain() }
                completion(.success(products))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
