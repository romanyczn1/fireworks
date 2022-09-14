//
//  NavigationHandlerProtocol.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import UIKit

protocol NavigationHandlerProtocol {

    func initialTransition(from window: UIWindow?)

    func handleUrlOpeningNavigation(for url: URL?, and window: UIWindow?)
    func handleShortcutItem(_ shortcutItem: UIApplicationShortcutItem, and window: UIWindow?)
}
