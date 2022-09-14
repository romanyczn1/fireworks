//
//  ProductSearchUseCaseProtocol.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import Foundation

protocol ProductSearchUseCaseProtocol {
    
    var didUpdateProductSearch: (() -> Void)? { get set }

    func getProductSearches() -> [ProductSearchDomain]
    func save(with searchText: String)
}
