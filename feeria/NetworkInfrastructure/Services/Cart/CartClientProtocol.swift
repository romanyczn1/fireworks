//
//  CartClientProtocol.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

protocol CartClientProtocol {

    func loadCart(completion: @escaping (Result<CartResult?, APIError>) -> Void)

}
