//
//  SearchResultSectionModel.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

import Foundation

enum SearchProductsResultSection {
    case recentSearches
    case products
    
    var title: String? {
        switch self {
        case .recentSearches:
            return NSLocalizedString("recentSearchesSection", comment: "")
        case .products:
            return nil
        }
    }
}
