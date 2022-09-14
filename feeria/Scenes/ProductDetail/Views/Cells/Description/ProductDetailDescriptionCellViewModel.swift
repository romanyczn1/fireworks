//
//  ProductDetailDescriptionCellViewModel.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import Foundation

protocol ProductDetailDescriptionCellViewModelProtocol {
    
    var description: String { get }
    var attention: String { get }
}

final class ProductDetailDescriptionCellViewModel: ProductDetailDescriptionCellViewModelProtocol {
    
    let description: String
    let attention: String
    
    init(description: String, attention: String) {
        self.description = description
        self.attention = attention
    }
}
