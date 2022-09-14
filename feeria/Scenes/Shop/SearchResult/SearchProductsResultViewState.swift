//
//  SearchProductsResultViewState.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import Foundation

enum SearchProductsResultViewState {

    case initial
    case empty
    case searching
    case populated([ProductDomain])
    case error(Error)

    var sections: [SearchProductsResultSection]? {
        switch self {
        case .populated:
            return [.products]
        case .initial:
            return [.recentSearches]
        case .searching, .empty, .error:
            return nil
        }
    }

    var currentSearchedProducts: [ProductDomain] {
        switch self {
        case .populated(let entities):
            return entities
        case .initial, .empty, .error, .searching:
            return []
        }
    }

}
