//
//  SearchProductResultProtocols.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

import Foundation

protocol SearchProductsResultViewModelProtocol {
    
    var viewState: Bindable<SearchProductsResultViewState> { get }
    
    var recentSearchCells: [RecentSearchCellViewModelProtocol] { get }
    var productCells: [ProductListCellViewModelProtocol] { get }
    
    var products: [ProductDomain] { get }

    func searchProducts(withSearchText searchText: String)
    func searchedProduct(at index: Int) -> ProductDomain

    func clearProducts()

}

protocol SearchProductsResultInteractorProtocol {

    func searchProducts(searchText: String, page: Int?, completion: @escaping (Result<[ProductDomain], Error>) -> Void)

    func getProductSearches() -> [ProductSearchDomain]
    func saveSearchText(_ searchText: String)

}
