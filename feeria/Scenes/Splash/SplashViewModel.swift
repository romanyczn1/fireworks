//
//  SplashViewModel.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import Foundation

final class SplashViewModel: SplashViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: SplashInteractorProtocol

    // MARK: - Properties

    var initialDownloadsEnded: (() -> Void)?

    // MARK: - Initializers

    init(interactor: SplashInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: - SplashViewModelProtocol

    func startInitialDownloads() {
        interactor.loadCart { result in
            let _ = result.getWrappedValue()
        }
        
        self.initialDownloadsEnded?()
    }
}
