//
//  ProductDetailReviewCell.swift
//  feeria
//
//  Created by ios1 on 5.09.22.
//

import UIKit

class ProductDetailReviewCell: UITableViewCell, ProductDetailReviewCellProtocol {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var ratingView: SwiftyStarRatingView!
    
    var viewModel: ProductDetailReviewCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        ratingView.filledStarImage = UIImage(named: "star_filled")
        ratingView.emptyStarImage = UIImage(named: "star_empty")
        ratingView.allowsHalfStars = false
        ratingView.continuous = false
        ratingView.isEnabled = false
    }
    
    private func setupBindables() {
        if let viewModel = viewModel {
             
            label.attributedText = String(format: NSLocalizedString("productDetailReviewText", comment: ""), viewModel.date.toString(), viewModel.name, viewModel.text).htmlToAttributedString
            ratingView.value = viewModel.rating
        }
    }
}
