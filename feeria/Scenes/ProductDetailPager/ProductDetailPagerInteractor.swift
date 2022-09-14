//
//  ProductDetailPagerInteractor.swift
//  feeria
//
//  Created by ios1 on 23.08.22.
//

class ProductDetailPagerInteractor: ProductDetailPagerInteractorProtocol {

    private let productUseCase: ProductUseCaseProtocol
//    private let accountUseCase: AccountUseCaseProtocol

//    private let authHandler: AuthenticationHandlerProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {//}, authHandler: AuthenticationHandlerProtocol) {
        self.productUseCase = useCaseProvider.productUseCase()
//        self.accountUseCase = useCaseProvider.accountUseCase()
//        self.authHandler = authHandler
    }

}
