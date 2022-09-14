//
//  ProductDetailHowToLaunchCellViewModel.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import Foundation

protocol ProductDetailHowToLaunchCellViewModelProtocol {
    
    var serialNumber: Int { get }
    var rule: String { get }
}

final class ProductDetailHowToLaunchCellViewModel: ProductDetailHowToLaunchCellViewModelProtocol {
    
    let rule: String
    let serialNumber: Int
    
    init(rule: String, serialNumber: Int) {
        self.rule = rule
        self.serialNumber = serialNumber
    }
}
