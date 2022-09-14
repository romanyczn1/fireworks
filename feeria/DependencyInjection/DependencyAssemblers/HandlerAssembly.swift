//
//  Handlerassembly.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import Foundation
import Swinject

final class HandlerAssembly: Assembly {

    func assemble(container: Container) {
//        container.register(AuthenticationHandlerProtocol.self) { resolver in
//            guard let useCaseProvider = resolver.resolve(UseCaseProviderProtocol.self) else {
//                fatalError("UseCaseProviderProtocol dependency could not be resolved")
//            }
//            return AuthenticationHandler(authUseCase: useCaseProvider.authUseCase(),
//                                         userUseCase: useCaseProvider.userUseCase())
//        }.inObjectScope(.container)

        container.register(NavigationHandlerProtocol.self) { _ in
            NavigationHandler()
        }.inObjectScope(.container)

//        container.register(GenreHandlerProtocol.self) { _ in
//            GenreHandler()
//        }.inObjectScope(.container)
//
//        container.register(ConfigurationHandlerProtocol.self) { _ in
//            ConfigurationHandler()
//        }.inObjectScope(.container)
    }

}
