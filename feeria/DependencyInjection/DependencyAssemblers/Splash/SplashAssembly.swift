//
//  SplashAssembly.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import Foundation
import Swinject

final class SplashAssembly: Assembly {

    func assemble(container: Container) {
        container.register(SplashInteractorProtocol.self) { resolver in
            guard let useCaseProvider = resolver.resolve(UseCaseProviderProtocol.self) else {
                fatalError("UseCaseProviderProtocol dependency could not be resolved")
            }
            return SplashInteractor(useCaseProvider: useCaseProvider)
        }

        container.register(SplashViewModelProtocol.self) { resolver in
            guard let interactor = resolver.resolve(SplashInteractorProtocol.self) else {
                fatalError("SplashInteractorProtocol dependency could not be resolved")
            }
            return SplashViewModel(interactor: interactor)
        }
    }

}
