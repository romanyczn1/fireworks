//
//  SearchProductsAssembly.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

import Foundation
import Swinject

final class SearchProductsAssembly: Assembly {

    func assemble(container: Container) {
        container.register(SearchProductsResultInteractorProtocol.self) { resolver in
            let useCaseProvider = resolver.resolve(UseCaseProviderProtocol.self)

            return SearchProductsResultInteractor(useCaseProvider: useCaseProvider!)
        }
        container.register(SearchProductsResultViewModelProtocol.self) { resolver in
            let interactor = resolver.resolve(SearchProductsResultInteractorProtocol.self)
            return SearchProductsResultViewModel(interactor: interactor!)
        }
    }

}
