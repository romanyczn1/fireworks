//
//  ProductDetailTitleCell.swift
//  feeria
//
//  Created by ios1 on 19.08.22.
//

import UIKit

class ProductDetailTitleCell: UITableViewCell, ProductDetailTitleCellProtocol {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingView: SwiftyStarRatingView!
    @IBOutlet weak var vendorCodeLabel: UILabel!
    
    var viewModel: ProductDetailTitleCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        selectionStyle = .none
        
        titleLabel.font = Font(.installed(.RobotoRegular), size: .custom(30)).instance
        titleLabel.textColor = ColorPalette.Label.defaultColor
                
        vendorCodeLabel.font = Font(.installed(.RobotoRegular), size: .custom(13)).instance
        vendorCodeLabel.textColor = ColorPalette.gray5
        
        ratingView.filledStarImage = UIImage(named: "star_filled")
        ratingView.emptyStarImage = UIImage(named: "star_empty")
        ratingView.allowsHalfStars = false
        ratingView.continuous = false
        ratingView.isEnabled = false
    }
    
    private func setupBindables() {
        if let viewModel = viewModel {
            
            titleLabel.text = viewModel.title
            vendorCodeLabel.text = NSLocalizedString("productDetailVendorCodeShort", comment: "") + viewModel.vendorCode
            ratingView.value = viewModel.rating
        }
    }
}
