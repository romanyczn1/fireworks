//
//  ProductListCell.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

import UIKit

final class ProductListCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!

    var viewModel: ProductListCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }

    // MARK: - Reactive Behavior

    private func setupBindables() {
        guard let viewModel = viewModel else { return }
        nameLabel.text = viewModel.name
        productImageView.image = UIImage(named: viewModel.image)
    }

}
