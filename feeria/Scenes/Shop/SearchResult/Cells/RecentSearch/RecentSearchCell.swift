//
//  RecentSearchCell.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

import UIKit

final class RecentSearchCell: UITableViewCell {

    @IBOutlet private weak var searchLabel: UILabel!

    var viewModel: RecentSearchCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Private

    private func setupUI() {
        setupSearchLabel()
    }

    private func setupSearchLabel() {
        searchLabel.font = Font(.system, size: .custom(15)).instance
        searchLabel.textColor = ColorPalette.Label.defaultColor
        searchLabel.adjustsFontForContentSizeCategory = true
    }

    private func setupBindables() {
        searchLabel.text = viewModel?.searchText
    }

}
