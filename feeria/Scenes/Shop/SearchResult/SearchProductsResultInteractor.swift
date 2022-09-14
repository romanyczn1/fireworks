//
//  SearchProductsResultInteractor.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

import Foundation

class SearchProductsResultInteractor: SearchProductsResultInteractorProtocol {
    
    private let productUseCase: ProductUseCaseProtocol
    private let productSearchUseCase: ProductSearchUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.productUseCase = useCaseProvider.productUseCase()
        self.productSearchUseCase = useCaseProvider.productSearchUseCase()
    }

    func searchProducts(searchText: String, page: Int?, completion: @escaping (Result<[ProductDomain], Error>) -> Void) {
//        productUseCase.getProducts(searchText: searchText, completion: completion)
        let mockProducts = [
            ProductDomain(id: 0, name: "Раз в год и палка стреляет", rating: 4.8, commentsCount: 35, chargesCount: 420, inchesCount: 1.25, timeCount: 90, price: 143601, discount: 0.15),
            ProductDomain(id: 1, name: "Раз в год и палка стреляет2", rating: 4.8, commentsCount: 35, chargesCount: 420, inchesCount: 1.25, timeCount: 90, price: 143601, discount: 0.15),
            ProductDomain(id: 2, name: "Пушка заряженная но не пуляет", rating: 4.8, commentsCount: 35, chargesCount: 420, inchesCount: 1.25, timeCount: 90, price: 143601, discount: 0.15),
            ProductDomain(id: 3, name: "Пушка заряженная и пуляет", rating: 4.8, commentsCount: 35, chargesCount: 420, inchesCount: 1.25, timeCount: 90, price: 143601, discount: 0.15),
            ProductDomain(id: 4, name: "Раз в год и палка стреляет3", rating: 4.8, commentsCount: 35, chargesCount: 420, inchesCount: 1.25, timeCount: 90, price: 143601, discount: 0.15)
        ]
        completion(.success(mockProducts))
    }

    func saveSearchText(_ searchText: String) {
        productSearchUseCase.save(with: searchText)
    }

    func getProductSearches() -> [ProductSearchDomain] {
        return productSearchUseCase.getProductSearches()
    }

}
