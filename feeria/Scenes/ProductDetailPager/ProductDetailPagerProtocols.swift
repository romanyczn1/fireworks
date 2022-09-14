//
//  ProductDetailPagerProtocols.swift
//  feeria
//
//  Created by ios1 on 23.08.22.
//

import UIKit

protocol ProductDetailPagerViewModelProtocol {
    
    var needUpdateControllers: Bindable<Void> { get }
    
    var products: [ProductDomain] { get }
    
    func barCellViewModel(for index: IndexPath) -> ProductBarCellViewModelProtocol
    
    func numberOfProducts() -> Int

}

protocol ProductDetailPagerInteractorProtocol {


    
}

protocol ProductDetailPagerCoordinatorProtocol: AnyObject {

    func productDetailController(with product: ProductDomain) -> ProductDetailViewController
}
