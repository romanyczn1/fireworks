//
//  ProductDetailPagerAssembly.swift
//  feeria
//
//  Created by ios1 on 23.08.22.
//

import Foundation
import Swinject

final class ProductDetailPagerAssembly: Assembly {

    func assemble(container: Container) {
        
        container.register(ProductDetailPagerInteractorProtocol.self) { resolver in
            let useCaseProvider = resolver.resolve(UseCaseProviderProtocol.self)
//            let authHandler = resolver.resolve(AuthenticationHandlerProtocol.self)

            return ProductDetailPagerInteractor(useCaseProvider: useCaseProvider!)
        }

        container.register(ProductDetailPagerViewModelProtocol.self) { (resolver, products: [ProductDomain]) in
            let interactor = resolver.resolve(ProductDetailPagerInteractorProtocol.self)

            return ProductDetailPagerViewModel(products, interactor: interactor!)
        }
    }

}
