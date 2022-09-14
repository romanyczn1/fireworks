//
//  CartProvider.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

enum CartProvider {

    case get

}

// MARK: - Endpoint

extension CartProvider: Endpoint {

    var base: String {
        return NetworkConfiguration.shared.baseAPIURLString
    }

    var path: String {
        switch self {
        case .get:
            return "/cart" //test name
        }
    }

    var headers: [String: String]? {
        return nil
    }

    var params: [String: Any]? {
        switch self {
        case .get:
            return nil
        }
    }

    var parameterEncoding: ParameterEnconding {
        switch self {
        case .get:
            return .defaultEncoding
        }
    }

    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        }
    }

}
