//
//  CategoryProvider.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

enum CategoryProvider {

    case getAll

}

// MARK: - Endpoint

extension CategoryProvider: Endpoint {

    var base: String {
        return NetworkConfiguration.shared.baseAPIURLString
    }

    var path: String {
        switch self {
        case .getAll:
            return "/api/catalog"
        }
    }

    var headers: [String: String]? {
        return nil
    }

    var params: [String: Any]? {
        switch self {
        case .getAll:
            return nil
        }
    }

    var parameterEncoding: ParameterEnconding {
        switch self {
        case .getAll:
            return .defaultEncoding
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getAll:
            return .get
        }
    }

}
