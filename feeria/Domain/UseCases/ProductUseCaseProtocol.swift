//
//  ProductUseCaseProtocol.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

protocol ProductUseCaseProtocol {

    func getProductDetail(for productId: Int, completion: @escaping (Result<ProductDomain, Error>) -> Void)
    
    func getPopularProducts(completion: @escaping (Result<[ProductDomain], Error>) -> Void)

    func getProducts(searchText: String, completion: @escaping (Result<[ProductDomain], Error>) -> Void)
}
