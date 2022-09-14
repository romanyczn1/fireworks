//
//  ProductDetailInteractor.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

class ProductDetailInteractor: ProductDetailInteractorProtocol {

    private let productUseCase: ProductUseCaseProtocol
//    private let accountUseCase: AccountUseCaseProtocol

//    private let authHandler: AuthenticationHandlerProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {//}, authHandler: AuthenticationHandlerProtocol) {
        self.productUseCase = useCaseProvider.productUseCase()
//        self.accountUseCase = useCaseProvider.accountUseCase()
//        self.authHandler = authHandler
    }

    func isUserSignedIn() -> Bool {
//        return authHandler.isUserSignedIn()
        return false
    }
    
    func getProductDetail(for productId: Int, completion: @escaping (Result<ProductDomain, Error>) -> Void) {
//        productUseCase.getProductDetail(for: productId, completion: completion)
        completion(.success(ProductDomain(id: 0, name: "Раз в год и палка стреляет", rating: 4.8, commentsCount: 35, chargesCount: 420, inchesCount: 1.25, timeCount: 90, price: 143601, discount: 0.15)))
    }
    
    func markProductAsFavorite(movieId: Int, favorite: Bool, completion: @escaping (Result<Bool, Error>) -> Void) {
//        accountUseCase.markMovieAsFavorite(movieId: movieId, favorite: favorite, completion: completion)
    }

}
