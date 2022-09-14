//
//  ProductDetailTitleCellViewModel.swift
//  feeria
//
//  Created by ios1 on 19.08.22.
//

protocol ProductDetailTitleCellViewModelProtocol {
    
    var title: String { get }
    var vendorCode: String { get }
    var rating: Double { get }
}

final class ProductDetailTitleCellViewModel: ProductDetailTitleCellViewModelProtocol {
    
    let title: String
    let vendorCode: String
    let rating: Double
    
    init(title: String, vendorCode: String, rating: Double) {
        self.title = title
        self.vendorCode = vendorCode
        self.rating = rating
    }
}
