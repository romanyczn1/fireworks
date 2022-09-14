//
//  CategoryCell.swift
//  feeria
//
//  Created by ios1 on 11.08.22.
//

import UIKit

class CategoryCell: UICollectionViewCell, CategoryCellProtocol {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var categoryImageView: UIImageView!
    
    var viewModel: CategoryCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        titleLabel.font = Font(.installed(.MontserratSemibold), size: .standard(.h5)).instance
        titleLabel.textColor = ColorPalette.gray3
        titleLabel.textAlignment = .center
        
        categoryImageView.contentMode = .scaleAspectFit
    }
    
    private func setupBindables() {
        if let viewModel = viewModel {
            titleLabel.text = viewModel.title
            categoryImageView.image = UIImage(named: viewModel.image)
        }
    }
}
