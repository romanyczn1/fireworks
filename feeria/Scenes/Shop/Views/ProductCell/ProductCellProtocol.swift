//
//  ProductCellProtocol.swift
//  feeria
//
//  Created by ios1 on 15.08.22.
//

import UIKit

protocol ProductCellProtocol {

    var productImageView: UIImageView! { get }
    var viewModel: ProductCellViewModelProtocol? { get set }
}
