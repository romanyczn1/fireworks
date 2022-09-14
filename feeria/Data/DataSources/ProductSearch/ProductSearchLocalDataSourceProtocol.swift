//
//  ProductSearchLocalDataSourceProtocol.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

protocol ProductSearchLocalDataSourceProtocol {
    
    var didUpdateProductSearch: (() -> Void)? { get set }

    func getProductSearches() -> [ProductSearchDomain]
    func save(with searchText: String)
}
