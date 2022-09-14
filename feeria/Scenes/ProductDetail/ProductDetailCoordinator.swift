//
//  ProductDetailCoordinator.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import UIKit

enum ProductDetailInfo {

    case complete(product: ProductDomain)
    case partial(productId: Int)
}

final class ProductDetailCoordinator: Coordinator, ProductDetailCoordinatorProtocol {

    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController

    var productInfo: ProductDetailInfo!

    // MARK: - Initializers

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - MovieDetailCoordinatorProtocol

    func start() {
        let viewController = ProductDetailViewController.instantiate()

        viewController.viewModel = viewModel(for: productInfo)
        viewController.userInterfaceHelper = DIContainer.shared.resolve()
        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: true)
    }

    private func viewModel(for productInfo: ProductDetailInfo) -> ProductDetailViewModelProtocol {
        switch productInfo {
        case .complete(let product):
            return DIContainer.shared.resolve(argument: product)
        case .partial(let productId):
            return DIContainer.shared.resolve(argument: productId)
        }
    }

}
