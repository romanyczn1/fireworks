//
//  SearchProductsResultViewModel.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

import Foundation

final class SearchProductsResultViewModel: SearchProductsResultViewModelProtocol {

    // MARK: - Properties

    private let interactor: SearchProductsResultInteractorProtocol
    
    // MARK: - Reactive properties
    
    let viewState: Bindable<SearchProductsResultViewState> = Bindable(.initial)

    // MARK: - Computed Properties
    
    var products: [ProductDomain] {
        return viewState.value.currentSearchedProducts
    }
    
    var recentSearchCells: [RecentSearchCellViewModelProtocol] {
        let searches = interactor.getProductSearches().prefix(5)
        return searches.map { RecentSearchCellViewModel(searchText: $0.searchText) }
    }

    var productCells: [ProductListCellViewModelProtocol] {
        return products.compactMap { ProductListCellViewModel($0)}
    }

    // MARK: - Initilalizers

    init(interactor: SearchProductsResultInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: - Movies handling

    func searchProducts(withSearchText searchText: String) {
        viewState.value = .searching
        interactor.saveSearchText(searchText)
        interactor.searchProducts(searchText: searchText,
                                  page: nil, completion: { result in
            switch result {
            case .success(let products):
                self.viewState.value = products.isEmpty ? .empty : .populated(products)
            case .failure(let error):
                self.viewState.value = .error(error)
            }
        })
    }
    
    func clearProducts() {
        viewState.value = .initial
    }

    // MARK: - Movie detail builder

    func searchedProduct(at index: Int) -> ProductDomain {
        return products[index]
    }
}
