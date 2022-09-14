//
//  ProductDetailManufacturerCellViewModel.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import Foundation

protocol ProductDetailManufacturerCellViewModelProtocol {
    
    var image: String { get }
    var name: String { get }
    var foundedYear: Int { get }
    var specialization: String { get }
    var numberOfProducts: Int { get }
    var numberOfProductsInStock: Int { get }
    var rating: Double { get }
    var description: String { get }
}

final class ProductDetailManufacturerCellViewModel: ProductDetailManufacturerCellViewModelProtocol {
    
    let image: String
    let name: String
    let foundedYear: Int
    let specialization: String
    let numberOfProducts: Int
    let numberOfProductsInStock: Int
    let rating: Double
    let description: String
    
    init(image: String,
         name: String,
         foundedYear: Int,
         specialization: String,
         numberOfProducts: Int,
         numberOfProductsInStock: Int,
         rating: Double,
         description: String) {
        self.image = image
        self.name = name
        self.foundedYear = foundedYear
        self.specialization = specialization
        self.numberOfProducts = numberOfProducts
        self.numberOfProductsInStock = numberOfProductsInStock
        self.rating = rating
        self.description = description
    }
}
