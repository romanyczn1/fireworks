//
//  ProductDetailPhotosCellViewModel.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import Foundation

protocol ProductDetailPhotosCellViewModelProtocol {

    var images: [String] { get }
    
}

final class ProductDetailPhotosCellViewModel: ProductDetailPhotosCellViewModelProtocol {

    let images: [String]

    init(_ images: [String]) {
        self.images = images
    }

}
