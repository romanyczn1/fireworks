//
//  CartRemoteDataSource.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

final class CartRemoteDataSource: CartRemoteDataSourceProtocol {
    
    private let client: CartClientProtocol

    init(client: CartClientProtocol) {
        self.client = client
    }
    
    func loadCart(completion: @escaping (Result<CartDomain, Error>) -> Void) {
        client.loadCart { result in
            switch result {
            case .success(let cartResult):
                guard let cartResult = cartResult else { return }
                let cart = cartResult.result.asDomain()
                completion(.success(cart))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
