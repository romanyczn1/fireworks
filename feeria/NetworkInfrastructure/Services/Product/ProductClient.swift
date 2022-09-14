//
//  ProductClient.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

import Foundation

class ProductClient: APIClient, ProductClientProtocol {

    let session: URLSession

    // MARK: - Initializers

    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        let configuration: URLSessionConfiguration = .default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData

        self.init(configuration: configuration)
    }
    
    func getPopularProducts(completion: @escaping (Result<ProductResult?, APIError>) -> Void) {
        let request = ProductProvider.popular.request
        
        fetch(with: request, decode: { json -> ProductResult? in
            guard let productResult = json as? ProductResult else { return nil }
            return productResult
        }, completion: completion)
    }
    
    func getProducts(searchText: String, completion: @escaping (Result<ProductResult?, APIError>) -> Void) {
        let request = ProductProvider.search(searchText: searchText).request
        
        fetch(with: request, decode: { json -> ProductResult? in
            guard let productResult = json as? ProductResult else { return nil }
            return productResult
        }, completion: completion)
    }
    
}
