//
//  CategoryRemoteDataSource.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

final class CategoryRemoteDataSource: CategoryRemoteDataSourceProtocol {
    
    private let client: CategoryClientProtocol

    init(client: CategoryClientProtocol) {
        self.client = client
    }

    func getCategories(completion: @escaping (Result<[ProductCategoryDomain], Error>) -> Void) {
        client.getCategories(completion: { result in
            switch result {
            case .success(let movieResult):
                guard let movieResult = movieResult else { return }
                let movies = movieResult.results.map { $0.asDomain() }
                completion(.success(movies))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }

}
