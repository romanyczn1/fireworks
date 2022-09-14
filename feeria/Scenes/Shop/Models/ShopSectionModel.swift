//
//  ShopSectionModel.swift
//  feeria
//
//  Created by ios1 on 11.08.22.
//

import Foundation

enum ShopSectionModel {
    case categoriesSection
    case productsSection
    
    var title: String {
        switch self {
        case .categoriesSection:
            return NSLocalizedString("catalogCategoriesSection", comment: "")
        case .productsSection:
            return NSLocalizedString("popularProductsSection", comment: "")
        }
    }
}
