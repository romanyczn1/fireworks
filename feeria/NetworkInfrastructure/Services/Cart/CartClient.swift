//
//  CartClient.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import Foundation

class CartClient: APIClient, CartClientProtocol {

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
    
    func loadCart(completion: @escaping (Result<CartResult?, APIError>) -> Void) {
        let request = CartProvider.get.request
        
        fetch(with: request, decode: { json -> CartResult? in
            guard let cartResult = json as? CartResult else { return nil }
            return cartResult
        }, completion: completion)
    }
    
}
