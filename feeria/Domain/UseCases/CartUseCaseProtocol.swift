//
//  CartUseCaseProtocol.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

protocol CartUseCaseProtocol {

    func getCart(completion: @escaping (Result<CartDomain, Error>) -> Void)

}
