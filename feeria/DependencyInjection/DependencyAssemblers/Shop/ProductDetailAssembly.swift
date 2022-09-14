//
//  ProductDetailAssembly.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import Foundation
import Swinject

final class ProductDetailAssembly: Assembly {

    func assemble(container: Container) {

        container.register(ProductDetailFactoryProtocol.self) { _ in
            ProductDetailFactory()
        }
        
        container.register(ProductDetailInteractorProtocol.self) { resolver in
            let useCaseProvider = resolver.resolve(UseCaseProviderProtocol.self)
//            let authHandler = resolver.resolve(AuthenticationHandlerProtocol.self)

            return ProductDetailInteractor(useCaseProvider: useCaseProvider!)
        }

        container.register(ProductDetailViewModelProtocol.self) { (resolver, product: ProductDomain) in
            let interactor = resolver.resolve(ProductDetailInteractorProtocol.self)
            let factory = resolver.resolve(ProductDetailFactoryProtocol.self)

            return ProductDetailViewModel(product, interactor: interactor!, factory: factory!)
        }

        container.register(ProductDetailViewModelProtocol.self) { (resolver, productId: Int) in
            let interactor = resolver.resolve(ProductDetailInteractorProtocol.self)
            let factory = resolver.resolve(ProductDetailFactoryProtocol.self)

            return ProductDetailViewModel(id: productId, interactor: interactor!, factory: factory!)
        }

        container.register(ProductDetailUIHelperProtocol.self) { resolver in
            let progressHUDAdapter = resolver.resolve(ProgressHUDAdapterProtocol.self)
            return ProductDetailUIHelper(progressHUDAdapter: progressHUDAdapter!)
        }
    }

}
