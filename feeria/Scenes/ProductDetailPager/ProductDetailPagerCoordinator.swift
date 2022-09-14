//
//  ProductDetailPagerCoordinator.swift
//  feeria
//
//  Created by ios1 on 23.08.22.
//

import UIKit

final class ProductDetailPagerCoordinator: Coordinator, ProductDetailPagerCoordinatorProtocol {

    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController

    var products: [ProductDomain] = []
    var selectedIndex = 0
    
    // MARK: - Initializers

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = ProductDetailPagerViewController.instantiate()
        
        viewController.moveToViewController(at: selectedIndex)
        viewController.viewModel = DIContainer.shared.resolve(argument: products)
        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: true)
    }
    
    // MARK: - ProductDetailCoordinatorProtocol
    
    func productDetailController(with product: ProductDomain) -> ProductDetailViewController {
        let viewController = ProductDetailViewController.instantiate()

        viewController.viewModel = DIContainer.shared.resolve(argument: product)
        viewController.userInterfaceHelper = DIContainer.shared.resolve()
//        viewController.coordinator = self
        
        return viewController
    }
}
