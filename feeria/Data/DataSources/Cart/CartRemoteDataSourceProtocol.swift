//
//  CartRemoteDataSourceProtocol.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

protocol CartRemoteDataSourceProtocol {
    
    func loadCart(completion: @escaping (Result<CartDomain, Error>) -> Void)
}
