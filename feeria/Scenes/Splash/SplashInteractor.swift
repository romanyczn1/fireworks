//
//  SplashInteractor.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

struct SplashInteractor: SplashInteractorProtocol {
    
    private let cartUseCase: CartUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.cartUseCase = useCaseProvider.cartUseCase()
    }

    func loadCart(completion: @escaping (Result<CartDomain, Error>) -> Void) {
        cartUseCase.getCart(completion: completion)
    }
}
