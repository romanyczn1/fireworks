//
//  ProductListCellViewModel.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

import Foundation

protocol ProductListCellViewModelProtocol {
    
    var name: String { get }
    var image: String { get }
}

class ProductListCellViewModel: ProductListCellViewModelProtocol {
    
    var image: String
    let name: String
    
    
    init(_ product: ProductDomain) {
        self.image = product.localImage
        self.name = product.name
    }
}
