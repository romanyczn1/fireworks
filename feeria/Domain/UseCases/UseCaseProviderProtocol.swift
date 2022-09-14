//
//  UseCaseProviderProtocol.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

protocol UseCaseProviderProtocol {

    func categoryUseCase() -> CategoryUseCaseProtocol
    func productUseCase() -> ProductUseCaseProtocol
    func cartUseCase() -> CartUseCaseProtocol
    func productSearchUseCase() -> ProductSearchUseCaseProtocol
}
