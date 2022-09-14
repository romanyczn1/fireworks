//
//  ProductProvider.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

enum ProductProvider {

    case popular
    case search(searchText: String)
}

// MARK: - Endpoint

extension ProductProvider: Endpoint {

    var base: String {
        return NetworkConfiguration.shared.baseAPIURLString
    }

    var path: String {
        switch self {
        case .popular:
            return "/api/products/popular"
        case .search(_):
            return "/api/products/search"
        }
    }

    var headers: [String: String]? {
        return nil
    }

    var params: [String: Any]? {
        switch self {
        case .popular:
            return nil
        case .search(searchText: let searchText):
            return ["query": searchText]
        }
    }

    var parameterEncoding: ParameterEnconding {
        switch self {
        case .popular, .search(_):
            return .defaultEncoding
        }
    }

    var method: HTTPMethod {
        switch self {
        case .popular, .search(_):
            return .get
        }
    }

}
