//
//  CategoryCellViewModel.swift
//  feeria
//
//  Created by ios1 on 10.08.22.
//

import Foundation

protocol CategoryCellViewModelProtocol {

    var title: String { get }
    var image: String { get }
    
}

final class CategoryCellViewModel: CategoryCellViewModelProtocol {

    let title: String
    let image: String

    init(_ category: ProductCategoryDomain) {
        title = category.title
        image = category.localImage
    }

}
