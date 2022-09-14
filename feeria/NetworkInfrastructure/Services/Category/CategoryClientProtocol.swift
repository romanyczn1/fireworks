//
//  CategoryClientProtocol.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

protocol CategoryClientProtocol {

    func getCategories(completion: @escaping (Result<CategoryResult?, APIError>) -> Void)

}
