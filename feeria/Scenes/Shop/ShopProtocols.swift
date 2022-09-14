//
//  ShopProtocols.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import UIKit

protocol ShopViewModelProtocol {

    var sections: Bindable<[ShopSectionModel]> { get }
    var startLoading: Bindable<Bool> { get }
    
    var categoryCells: [CategoryCellViewModelProtocol] { get }
    var productCells: [ProductCellViewModelProtocol] { get }
    
    var products: [ProductDomain] { get }
    
    func getCategories()
    func getProducts()
    
    func product(for index: Int) -> ProductDomain
}

protocol ShopInteractorProtocol {

    func loadCategories(completion: @escaping (Result<[ProductCategoryDomain], Error>) -> Void)
    
    func loadProducts(completion: @escaping (Result<[ProductDomain], Error>) -> Void)
}

protocol ShopCoordinatorProtocol: AnyObject {

    func showProductDetail(at index: Int, for products: [ProductDomain], with navigationConfiguration: ShopNavigationConfiguration?)
    
    func embedSearchController(on parentViewController: SearchProductsResultViewControllerDelegate) -> DefaultSearchController
}

protocol ShopNavigationDelegate: UINavigationControllerDelegate {

    var parentCoordinator: Coordinator? { get set }

    func configure(selectedFrame: CGRect?, with imageToTransition: UIImage?)
    func updateOffset(_ verticalSafeAreaOffset: CGFloat)

}
