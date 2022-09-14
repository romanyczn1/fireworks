//
//  ProductDetailCartCellViewModel.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import Foundation

protocol ProductDetailCartCellViewModelProtocol {

    var price: Double { get }
    var discount: Double { get }
}

final class ProductDetailCartCellViewModel: ProductDetailCartCellViewModelProtocol {

    let price: Double
    let discount: Double

    init(price: Double, discount: Double) {
        self.price = price
        self.discount = discount
    }

}
