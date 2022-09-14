//
//  SplashViewController.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import UIKit

class SplashViewController: UIViewController {

    var viewModel: SplashViewModelProtocol?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ColorPalette.mainAppColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // We can only get the window and scene of this view controller
        // only after it has been added to the window hierarchy
        setupBindables()
        viewModel?.startInitialDownloads()
    }

    // MARK: - Reactive Behavior

    private func setupBindables() {
        viewModel?.initialDownloadsEnded = { [weak self] in
            guard let self = self else { return }
            let navigationHandler: NavigationHandlerProtocol = DIContainer.shared.resolve()
            DispatchQueue.main.async {
                navigationHandler.initialTransition(from: self.view.window)
            }
        }
    }

}
