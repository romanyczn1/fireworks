//
//  ProductDetailReviewCellViewModel.swift
//  feeria
//
//  Created by ios1 on 5.09.22.
//

import Foundation

struct TempReview {
    let date: Date
    let name: String
    let text: String
    let raiting: Double
}

protocol ProductDetailReviewCellViewModelProtocol {
    
    var date: Date { get }
    var name: String { get }
    var text: String { get }
    var rating: Double { get }
}

final class ProductDetailReviewCellViewModel: ProductDetailReviewCellViewModelProtocol {
    
    var date: Date
    var name: String
    var text: String
    var rating: Double
    
    init(date: Date, name: String, text: String, rating: Double) {
        self.date = date
        self.name = name
        self.text = text
        self.rating = rating
    }
}
