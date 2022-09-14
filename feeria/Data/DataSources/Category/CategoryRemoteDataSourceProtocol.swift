//
//  CategoryRemoteDataSourceProtocol.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

protocol CategoryRemoteDataSourceProtocol {
    
    func getCategories(completion: @escaping (Result<[ProductCategoryDomain], Error>) -> Void)
}
