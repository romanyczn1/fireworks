//
//  ProductDetailPagerViewModel.swift
//  feeria
//
//  Created by ios1 on 23.08.22.
//

import Foundation

final class ProductDetailPagerViewModel: ProductDetailPagerViewModelProtocol {
    
    // MARK: - Reactive properties
    
    var needUpdateControllers: Bindable<Void> = Bindable(())
    
    // MARK: - Dependencies
    
    private let interactor: ProductDetailPagerInteractorProtocol
    
    // MARK: - Properties
    
    private(set) var products: [ProductDomain]
    
    // MARK: - Initializers

    init(_ products: [ProductDomain], interactor: ProductDetailPagerInteractorProtocol) {
        self.interactor = interactor
        self.products = products
    }
    
    // MARK: - ProductDetailViewModelProtocol
    
    func barCellViewModel(for index: IndexPath) -> ProductBarCellViewModelProtocol {
        return ProductBarCellViewModel(products[index.item])
    }
    
    func numberOfProducts() -> Int {
        return products.count
    }
    
}
