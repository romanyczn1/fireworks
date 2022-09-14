//
//  ProductDetailPresentsCellViewModel.swift
//  feeria
//
//  Created by ios1 on 5.09.22.
//

struct TempPresent {
    let name: String
    let image: String
}

protocol ProductDetailPresentsCellViewModelProtocol {
    
    var presents: [TempPresent] { get }
}

final class ProductDetailPresentsCellViewModel: ProductDetailPresentsCellViewModelProtocol {
    
    var presents: [TempPresent]
    
    init(presents: [TempPresent]) {
        self.presents = presents
    }
    
}
