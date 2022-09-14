//
//  ShopCoordinator.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import UIKit

struct ShopNavigationConfiguration {

    let selectedFrame: CGRect
    let imageToTransition: UIImage?
    let transitionOffset: CGFloat

    init(selectedFrame: CGRect, imageToTransition: UIImage?, transitionOffset: CGFloat) {
        self.selectedFrame = selectedFrame
        self.imageToTransition = imageToTransition
        self.transitionOffset = transitionOffset
    }

}

final class ShopCoordinator: NSObject, ShopCoordinatorProtocol, RootCoordinator, ProductDetailCoordinable {

    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController

    var navigationDelegate: ShopNavigationDelegate!

    // MARK: - Initializers

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Coordinator

    var rootIdentifier: String {
        return RootCoordinatorIdentifier.shop
    }

    func start() {
        let viewController = ShopViewController.instantiate()

        viewController.viewModel = DIContainer.shared.resolve()
        viewController.coordinator = self

//        setupNavigationDelegate()

        navigationController.pushViewController(viewController, animated: true)
    }
    
    func embedSearchController(on parentViewController: SearchProductsResultViewControllerDelegate) -> DefaultSearchController {
        let searchResultController = SearchProductsResultViewController(viewModel: DIContainer.shared.resolve())

        let searchController = DefaultSearchController(searchResultsController: searchResultController)

        searchResultController.delegate = parentViewController
        searchResultController.coordinator = self

        parentViewController.navigationItem.searchController = searchController
        parentViewController.definesPresentationContext = true

        return searchController
    }

    func showProductDetail(at index: Int, for products: [ProductDomain], with navigationConfiguration: ShopNavigationConfiguration?) {
//        configureNavigationDelegate(with: navigationConfiguration)

        showProductDetail(at: index, for: products)
    }

    // MARK: - Navigation Configuration

//    private func setupNavigationDelegate() {
//        // We only configure the delegate if it is needed.
//        guard navigationController.delegate == nil else { return }
//
//        navigationDelegate = ShopNavigation()
//        navigationDelegate.parentCoordinator = self
//
//        navigationController.delegate = navigationDelegate
//    }
//
//    private func configureNavigationDelegate(with navigationConfiguration: ShopNavigationConfiguration?) {
//        guard let navigationConfiguration = navigationConfiguration else {
//            navigationController.delegate = nil
//            return
//        }
//        setupNavigationDelegate()
//
//        navigationDelegate.configure(selectedFrame: navigationConfiguration.selectedFrame,
//                                     with: navigationConfiguration.imageToTransition)
//        navigationDelegate.updateOffset(navigationConfiguration.transitionOffset)
//    }

}
