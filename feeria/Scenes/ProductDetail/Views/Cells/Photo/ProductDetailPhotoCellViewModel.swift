//
//  ProductDetailPhotoCellViewModel.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import Foundation

protocol ProductDetailPhotoCellViewModelProtocol {
    
    var photo: String { get }
}

final class ProductDetailPhotoCellViewModel: ProductDetailPhotoCellViewModelProtocol {
    
    let photo: String
    
    init(photo: String) {
        self.photo = photo
    }
}
