//
//  RecentSearchCellViewModel.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

import Foundation

protocol RecentSearchCellViewModelProtocol {

    var searchText: String { get }

}

final class RecentSearchCellViewModel: RecentSearchCellViewModelProtocol {

    let searchText: String

    init(searchText: String) {
        self.searchText = searchText
    }

}
