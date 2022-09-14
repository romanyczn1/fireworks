//
//  ShopViewModel.swift
//  feeria
//
//  Created by ios1 on 10.08.22.
//

import Foundation

final class ShopViewModel: ShopViewModelProtocol {

    // MARK: - Dependencies

    private let interactor: ShopInteractorProtocol

    // MARK: - Reactive properties

    private(set) var sections: Bindable<[ShopSectionModel]> = Bindable([])
    private(set) var startLoading: Bindable<Bool> = Bindable(false)

    // MARK: - Computed properties

    var categoryCells: [CategoryCellViewModelProtocol] {
        return categories.compactMap { CategoryCellViewModel($0) }
    }
    
    var productCells: [ProductCellViewModelProtocol] {
        return products.compactMap { ProductCellViewModel($0) }
    }
    
    private var categories: [ProductCategoryDomain] = []
    private(set) var products: [ProductDomain] = []

    // MARK: - Initializers

    init(interactor: ShopInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: - ShopViewModelProtocol

    func getCategories() {
        let showLoader = categories.isEmpty && products.isEmpty
        fetchCategories(showLoader: showLoader)
    }
    
    func getProducts() {
        let showLoader = categories.isEmpty && products.isEmpty
        fetchProducts(showLoader: showLoader)
    }
    
    func product(for index: Int) -> ProductDomain {
        return products[index]
    }

    // MARK: - Private
    
    private func updateSections() {
        var sections: [ShopSectionModel] = []
        
        if !categories.isEmpty {
            sections.append(.categoriesSection)
        }
        if !products.isEmpty {
            sections.append(.productsSection)
        }
        
        self.sections.value = sections
    }

    private func fetchCategories(showLoader: Bool = false) {
        startLoading.value = showLoader
        interactor.loadCategories { [weak self] result in
            self?.startLoading.value = false
            switch result {
            case .success(let categories):
                self?.categories = categories
                self?.updateSections()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchProducts(showLoader: Bool = false) {
        
        startLoading.value = showLoader
        interactor.loadProducts { [weak self] result in
            self?.startLoading.value = false
            switch result {
            case .success(let products):
                self?.products = products
                self?.updateSections()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
