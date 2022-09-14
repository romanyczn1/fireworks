//
//  ProductDesignCellViewModel.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import Foundation

protocol ProductDetailDesignCellViewModelProtocol {
    
    var image: String { get }
    var text: String { get }
}

final class ProductDetailDesignCellViewModel: ProductDetailDesignCellViewModelProtocol {
    
    let image: String
    let text: String
    
    init(image: String, text: String) {
        self.image = image
        self.text = text
    }
}
