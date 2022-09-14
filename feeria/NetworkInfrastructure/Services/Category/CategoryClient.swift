//
//  CategoryClient.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import Foundation

class CategoryClient: APIClient, CategoryClientProtocol {

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
    
    func getCategories(completion: @escaping (Result<CategoryResult?, APIError>) -> Void) {
        let request = CategoryProvider.getAll.request
        
        fetch(with: request, decode: { json -> CategoryResult? in
            guard let categoryResult = json as? CategoryResult else { return nil }
            return categoryResult
        }, completion: completion)
    }
    
}
