//
//  CategoryRepository.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

public class CategoryRepository: CategoryUseCaseProtocol {
    
    private var remoteDataSource: CategoryRemoteDataSourceProtocol

    init(remoteDataSource: CategoryRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getCategories(completion: @escaping (Result<[ProductCategoryDomain], Error>) -> Void) {
        remoteDataSource.getCategories(completion: completion)
    }
}
