//
//  ProductCellViewModel.swift
//  feeria
//
//  Created by ios1 on 11.08.22.
//

import Foundation

protocol ProductCellViewModelProtocol {

    var name: String { get }
    var raiting: Double { get }
    var commentsCount: Int { get }
    var image: String { get }
    var chargesCount: Int { get }
    var inchesCount: Double { get }
    var timeCount: Int { get }
    var price: Double { get }
    var discount: Double { get }
}

final class ProductCellViewModel: ProductCellViewModelProtocol {

    let name: String
    let raiting: Double
    let commentsCount: Int
    let image: String
    let chargesCount: Int
    let inchesCount: Double
    let timeCount: Int
    let price: Double
    let discount: Double

    init(_ product: ProductDomain) {
        name = product.name
        raiting = product.rating
        commentsCount = product.commentsCount
        image = product.localImage
        chargesCount = product.chargesCount
        inchesCount = product.inchesCount
        timeCount = product.timeCount
        price = product.price
        discount = product.discount
    }
}
