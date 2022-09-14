//
//  ProductDetailManufacturerCell.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import UIKit

class ProductDetailManufacturerCell: UITableViewCell, ProductDetailManufacturerCellProtocol {
        
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var manufacturerImageView: UIImageView!
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var foundedView: UIView!
    @IBOutlet weak var foundedLabel: UILabel!
    @IBOutlet weak var foundedValueLabel: UILabel!
    
    @IBOutlet weak var specializationView: UIView!
    @IBOutlet weak var specializationLabel: UILabel!
    @IBOutlet weak var specializationValueLabel: UILabel!
    
    @IBOutlet weak var numberOfProductsView: UIView!
    @IBOutlet weak var numberOfProductsLabel: UILabel!
    @IBOutlet weak var numberOfProductsValueLabel: UILabel!
    
    @IBOutlet weak var inStockView: UIView!
    @IBOutlet weak var inStockLabel: UILabel!
    @IBOutlet weak var inStockValueLabel: UILabel!
    
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingValueLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var moreButton: UIButton!
    
    var viewModel: ProductDetailManufacturerCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        setupLocalizables()
    }
    
    private func setupBindables() {
        if let viewModel = viewModel {
            
            manufacturerImageView.image = UIImage(named: viewModel.image)
            nameLabel.text = viewModel.name
            foundedValueLabel.attributedText = String(format: NSLocalizedString("productDetailManufacturerFoundedValue", comment: ""), "\(viewModel.foundedYear)").htmlToAttributedString
            specializationValueLabel.text = viewModel.specialization
            numberOfProductsValueLabel.text = "\(viewModel.numberOfProducts)"
            inStockValueLabel.text = "\(viewModel.numberOfProductsInStock)"
            
            let ratingAttr = NSMutableAttributedString(string: "\(viewModel.rating)")
            let attachment = NSTextAttachment()
            attachment.image = UIImage(named: "rating_star")
            ratingAttr.append(NSAttributedString(attachment: attachment))
            ratingValueLabel.attributedText = ratingAttr
            
            descriptionLabel.text = viewModel.description
        }
    }
}

extension ProductDetailManufacturerCell {
    
    private func setupUI() {
        
        contentView.backgroundColor = ColorPalette.lightGrayBackground
        
        titleLabel.font = Font(.installed(.RobotoLight), size: .custom(22)).instance
        
        manufacturerImageView.contentMode = .scaleAspectFill
        manufacturerImageView.layer.cornerRadius = 3
        manufacturerImageView.layer.masksToBounds = true
        
        nameView.backgroundColor = .clear
        nameLabel.textColor = ColorPalette.gray3
        
        foundedView.backgroundColor = .clear
        foundedLabel.font = Font(.installed(.RobotoRegular), size: .standard(.h3)).instance
        foundedLabel.textColor = ColorPalette.gray3
        
        specializationView.backgroundColor = .clear
        specializationLabel.font = Font(.installed(.RobotoRegular), size: .standard(.h3)).instance
        specializationLabel.textColor = ColorPalette.gray3
        specializationValueLabel.font = Font(.installed(.RobotoBold), size: .standard(.h3)).instance
        specializationValueLabel.textColor = ColorPalette.gray3
        
        numberOfProductsView.backgroundColor = .clear
        numberOfProductsValueLabel.font = Font(.installed(.RobotoBold), size: .standard(.h3)).instance
        numberOfProductsValueLabel.textColor = ColorPalette.gray3
        
        inStockView.backgroundColor = .clear
        inStockValueLabel.font = Font(.installed(.RobotoBold), size: .standard(.h3)).instance
        inStockValueLabel.textColor = ColorPalette.gray3
        
        inStockLabel.font = Font(.installed(.RobotoRegular), size: .standard(.h3)).instance
        inStockLabel.textColor = ColorPalette.mainAppColor
        
        ratingView.backgroundColor = .clear
        ratingLabel.font = Font(.installed(.RobotoRegular), size: .standard(.h3)).instance
        ratingLabel.textColor = ColorPalette.gray3
        ratingValueLabel.font = Font(.installed(.RobotoRegular), size: .standard(.h3)).instance
        ratingValueLabel.textColor = ColorPalette.gray3
        
        descriptionLabel.font = Font(.installed(.RobotoRegular), size: .custom(13)).instance
        descriptionLabel.textColor = ColorPalette.gray6
        
        moreButton.setTitleColor(ColorPalette.mainAppColor, for: .normal)
        moreButton.titleLabel?.font = Font(.installed(.RobotoRegular), size: .custom(13)).instance
    }
    
    private func setupLocalizables() {
        titleLabel.text = NSLocalizedString("productDetailManufacturerTitle", comment: "")
        foundedLabel.text = NSLocalizedString("productDetailManufacturerFounded", comment: "")
        specializationLabel.text = NSLocalizedString("productDetailManufacturerSpecialization", comment: "")
        numberOfProductsLabel.attributedText = NSLocalizedString("productDetailManufacturerNumberOfProducts", comment: "").htmlToAttributedString
        inStockLabel.text = NSLocalizedString("productDetailManufacturerInStock", comment: "")
        ratingLabel.text = NSLocalizedString("productDetailManufacturerRating", comment: "")
        moreButton.setTitle(NSLocalizedString("more", comment: ""), for: .normal)
    }
}
