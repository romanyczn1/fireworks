//
//  ProductDetailCoordinable.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

protocol ProductDetailCoordinable {

    func showProductDetail(at index: Int, for products: [ProductDomain])

}

extension ProductDetailCoordinable where Self: Coordinator {

    func showProductDetail(at index: Int, for products: [ProductDomain]) {
        let coordinator = ProductDetailPagerCoordinator(navigationController: navigationController)
        coordinator.products = products
        coordinator.selectedIndex = index
        coordinator.parentCoordinator = unwrappedParentCoordinator
        
        unwrappedParentCoordinator.childCoordinators.append(coordinator)
        coordinator.start()
        
//        let coordinator = ProductDetailCoordinator(navigationController: navigationController)
//
//        coordinator.productInfo = .complete(product: product)
//        coordinator.parentCoordinator = unwrappedParentCoordinator
//
//        unwrappedParentCoordinator.childCoordinators.append(coordinator)
//        coordinator.start()
    }

}
