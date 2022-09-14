//
//  ShopAssembly.swift
//  feeria
//
//  Created by ios1 on 4.08.22.
//

import Foundation
import Swinject

final class ShopAssembly: Assembly {

    func assemble(container: Container) {
        container.register(ShopInteractorProtocol.self, name: "Shop") { resolver in
            guard let useCaseProvider = resolver.resolve(UseCaseProviderProtocol.self) else {
                fatalError("UseCaseProviderProtocol dependency could not be resolved")
            }
            return ShopInteractor(useCaseProvider: useCaseProvider)
        }
        
        container.register(ShopViewModelProtocol.self, name: nil) { resolver in
            guard let interactor = resolver.resolve(ShopInteractorProtocol.self, name: "Shop") else {
                fatalError("ShopInteractorProtocol dependency could not be resolved")
            }
            return ShopViewModel(interactor: interactor)
        }
    }

}
