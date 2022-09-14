//
//  ProductBarCell.swift
//  feeria
//
//  Created by ios1 on 23.08.22.
//

import UIKit

class ProductBarCell: UICollectionViewCell, ProductBarCellProtocol {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var chargeCountLabel: UILabel!
    @IBOutlet weak var inchesCountLabel: UILabel!
    @IBOutlet weak var timeCountLabel: UILabel!
        
    @IBOutlet weak var priceLabel: UILabel!
    
    var viewModel: ProductBarCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupBindables() {
        if let viewModel = viewModel {
            nameLabel.text = viewModel.name
            ratingLabel.text = "\(viewModel.raiting)"
            productImageView.image = UIImage(named: viewModel.image)
            chargeCountLabel.text = "\(viewModel.chargesCount)"
            inchesCountLabel.text = "\(viewModel.inchesCount.withSpaces(decimalSeparator: ","))”"
            timeCountLabel.text = "\(viewModel.timeCount)"
            priceLabel.text = "\((viewModel.price).withSpacesWithoutCoins()) ₽"
        }
    }
}

extension ProductBarCell {
    
    private func setupUI() {
        layer.borderColor = ColorPalette.mainAppColor.cgColor
        
        nameLabel.font = Font(.installed(.RubikLight), size: .custom(8.34)).instance
        nameLabel.textColor = ColorPalette.mainAppColor
        
        ratingLabel.font = Font(.installed(.RubikRegular), size: .custom(9)).instance
        ratingLabel.textColor = ColorPalette.gray1

        chargeCountLabel.font = Font(.installed(.RubikRegular), size: .custom(9)).instance
        chargeCountLabel.textColor = ColorPalette.gray6

        inchesCountLabel.font = Font(.installed(.RubikRegular), size: .custom(9)).instance
        inchesCountLabel.textColor = ColorPalette.gray6
        
        timeCountLabel.font = Font(.installed(.RubikRegular), size: .custom(9)).instance
        timeCountLabel.textColor = ColorPalette.gray6
        
        priceLabel.font = Font(.installed(.RubikBold), size: .custom(9.94)).instance
        priceLabel.textColor = ColorPalette.gray6
        priceLabel.backgroundColor = ColorPalette.yellow
    }
}
