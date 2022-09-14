//
//  SplashBuilder.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import UIKit

final class SplashBuilder {

    class func buildViewController() -> UIViewController {
        let viewController = SplashViewController()
        viewController.viewModel = DIContainer.shared.resolve()

        let navigationController = UINavigationController(rootViewController: viewController)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController]

        return tabBarController
    }

}
