//
//  ProductDetailSection.swift
//  feeria
//
//  Created by ios1 on 19.08.22.
//

import Foundation

struct ProductDetailCollapsibleSection {
    var types: [ProductDetailViewSection]
    var opened: Bool
    var selectedType: ProductDetailViewSection
}

enum ProductDetailViewSection {
    case productTitle
    case productInfo
    case cart
    case deliveryInfo
    case characteristics
    case paymentMethods
    case presents
    case reviews
    case howToLaunch
    case productDesign
    case description
    case photos
    case postOrderInfo
    case manufacturer
    case improveApp
    
    var name: String? {
        switch self {
        case .reviews:
            return NSLocalizedString("productDetailReviews", comment: "")
        case .howToLaunch:
            return NSLocalizedString("productDetailHowToLaunch", comment: "")
        case .productDesign:
            return NSLocalizedString("productDetailProductDesign", comment: "")
        default:
            return nil
        }
    }
}
