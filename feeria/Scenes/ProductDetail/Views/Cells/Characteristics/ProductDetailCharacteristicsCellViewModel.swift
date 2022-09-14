//
//  ProductDetailCharacteristicsCellViewModel.swift
//  feeria
//
//  Created by ios1 on 23.08.22.
//

import Foundation

protocol ProductDetailCharacteristicsCellViewModelProtocol {

    var chargeCount: Int { get }
    var inchesCount: Double { get }
    var timeCount: Int { get }
    var height: Int { get }
    var effectsCount: Int { get }
    var type: String { get }
}

final class ProductDetailCharacteristicsCellViewModel: ProductDetailCharacteristicsCellViewModelProtocol {

    let chargeCount: Int
    let inchesCount: Double
    let timeCount: Int
    let height: Int
    let effectsCount: Int
    let type: String

    init(chargeCount: Int, inchesCount: Double, timeCount: Int, height: Int, effectsCount: Int, type: String) {
        self.chargeCount = chargeCount
        self.inchesCount = inchesCount
        self.timeCount = timeCount
        self.height = height
        self.effectsCount = effectsCount
        self.type = type
    }

}
