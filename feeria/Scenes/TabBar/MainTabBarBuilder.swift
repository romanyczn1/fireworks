//
//  MainTabBarBuilder.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import UIKit

struct RootCoordinatorIdentifier {
    static let shop = "shop"
}

final class MainTabBarBuilder {

    class func buildViewCoordinators() -> [RootCoordinator] {

        let shopNavigationController = createNavigationController(title: NSLocalizedString("tabBarShopItem", comment: ""), image: UIImage(named: "ShopItem")!)
        let shopCoordinator = ShopCoordinator(navigationController: shopNavigationController)
        shopCoordinator.start()

        return [
            shopCoordinator
        ]
    }

    class func createNavigationController(title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image

        return navController
    }

}
