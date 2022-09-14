//
//  ProductClientProtocol.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

protocol ProductClientProtocol {

    func getPopularProducts(completion: @escaping (Result<ProductResult?, APIError>) -> Void)

    func getProducts(searchText: String, completion: @escaping (Result<ProductResult?, APIError>) -> Void)
}
