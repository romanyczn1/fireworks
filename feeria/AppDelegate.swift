//
//  AppDelegate.swift
//  feeria
//
//  Created by ios1 on 2.08.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationHandler: NavigationHandlerProtocol?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        _ = DIContainer.shared
        
        configureGlobalAppearanceIfNeeded()
        
        navigationHandler = DIContainer.shared.resolve()
                
        window = UIWindow()
        
        if let launchOptions = launchOptions,
            let shortcutItem = launchOptions[UIApplication.LaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            navigationHandler?.handleShortcutItem(shortcutItem, and: window)
        }
                
        window?.rootViewController = SplashBuilder.buildViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

