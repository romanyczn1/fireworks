//
//  AppDelegate+Appearance.swift
//  feeria
//
//  Created by ios1 on 15.08.22.
//

import UIKit

extension AppDelegate {

    func configureGlobalAppearanceIfNeeded() {
        if #available(iOS 15, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.backgroundColor = ColorPalette.mainAppColor
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBar.appearance().standardAppearance

            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundColor = ColorPalette.mainAppColor
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
        }
    }

}
