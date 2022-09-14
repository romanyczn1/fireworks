//
//  ShopInteractor.swift
//  feeria
//
//  Created by ios1 on 10.08.22.
//

struct ShopInteractor: ShopInteractorProtocol {
    
    private let categoryUseCase: CategoryUseCaseProtocol
    private let productUseCase: ProductUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.categoryUseCase = useCaseProvider.categoryUseCase()
        self.productUseCase = useCaseProvider.productUseCase()
    }
    
    func loadCategories(completion: @escaping (Result<[ProductCategoryDomain], Error>) -> Void) {
//        categoryUseCase.getCategories(completion: completion)
        let mockCategories = [
            ProductCategoryDomain(id: 0, title: "Салюты малые"),
            ProductCategoryDomain(id: 1, title: "Салюты средние"),
            ProductCategoryDomain(id: 2, title: "Салюты крупные"),
            ProductCategoryDomain(id: 3, title: "Супер-салюты"),
            ProductCategoryDomain(id: 4, title: "Фонтаны"),
            ProductCategoryDomain(id: 5, title: "Ракеты"),
            ProductCategoryDomain(id: 6, title: "Одиночные салюты"),
            ProductCategoryDomain(id: 7, title: "Римские свечи"),
            ProductCategoryDomain(id: 8, title: "Петарды"),
            ProductCategoryDomain(id: 9, title: "Наземные, летающие"),
            ProductCategoryDomain(id: 10, title: "Хлопушки"),
            ProductCategoryDomain(id: 11, title: "Бенгальские огни"),
            ProductCategoryDomain(id: 12, title: "Мастер подбора"),
            ProductCategoryDomain(id: 13, title: "Факелы"),
            ProductCategoryDomain(id: 14, title: "Мастер подбора")
        ]
        completion(.success(mockCategories))
    }
    
    func loadProducts(completion: @escaping (Result<[ProductDomain], Error>) -> Void) {
//        productUseCase.getPopularProducts(completion: completion)
        let mockProducts = [
            ProductDomain(id: 0, name: "Раз в год и палка стреляет", rating: 4.8, commentsCount: 35, chargesCount: 420, inchesCount: 1.25, timeCount: 90, price: 143601, discount: 0.15),
            ProductDomain(id: 1, name: "Раз в год и палка стреляет2", rating: 4.8, commentsCount: 35, chargesCount: 420, inchesCount: 1.25, timeCount: 90, price: 143601, discount: 0.15),
            ProductDomain(id: 2, name: "Пушка заряженная но не пуляет", rating: 4.8, commentsCount: 35, chargesCount: 420, inchesCount: 1.25, timeCount: 90, price: 143601, discount: 0.15),
            ProductDomain(id: 3, name: "Пушка заряженная и пуляет", rating: 4.8, commentsCount: 35, chargesCount: 420, inchesCount: 1.25, timeCount: 90, price: 143601, discount: 0.15),
            ProductDomain(id: 4, name: "Раз в год и палка стреляет3", rating: 4.8, commentsCount: 35, chargesCount: 420, inchesCount: 1.25, timeCount: 90, price: 143601, discount: 0.15)
        ]
        completion(.success(mockProducts))
    }
}
