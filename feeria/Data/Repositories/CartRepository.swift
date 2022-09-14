//
//  CartRepository.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

public class CartRepository: CartUseCaseProtocol {
    
    private var remoteDataSource: CartRemoteDataSourceProtocol

    init(remoteDataSource: CartRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getCart(completion: @escaping (Result<CartDomain, Error>) -> Void) {
        remoteDataSource.loadCart(completion: completion)
    }
    
}
