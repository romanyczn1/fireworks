//
//  ProductDetailCartCell.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import UIKit

class ProductDetailCartCell: UITableViewCell, ProductDetailCartCellProtocol {
        
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var inStockLabel: UILabel!
    @IBOutlet weak var toCartButton: UIButton!
    @IBOutlet weak var buyButton: DashedButton!
    
    var viewModel: ProductDetailCartCellViewModelProtocol? {
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
        
        toCartButton.layer.cornerRadius = 4
        toCartButton.backgroundColor = ColorPalette.orange
        toCartButton.tintColor = .white
        toCartButton.setTitle(NSLocalizedString("productDetailToCart", comment: ""), for: .normal)
        toCartButton.titleLabel?.font = Font(.installed(.RubikRegular), size: .custom(16)).instance
        toCartButton.setImage(UIImage(named: "add_to_cart"), for: .normal)
        toCartButton.setInsets(forContentPadding: .zero, imageTitlePadding: 10)
        
        buyButton.setTitle(NSLocalizedString("productDetailBuyInClick", comment: ""), for: .normal)
        buyButton.setImage(UIImage(named: "buy"), for: .normal)
        buyButton.setInsets(forContentPadding: UIEdgeInsets(top: 15, left: 0, bottom: 13, right: 0), imageTitlePadding: 10)
        buyButton.dashColor = ColorPalette.green
        buyButton.tintColor = ColorPalette.green
    }
    
    private func setupBindables() {
        if let viewModel = viewModel {
            
            let priceAttr = NSMutableAttributedString(string: viewModel.price.withSpacesWithoutCoins(),
                                                      attributes: [.font: Font(.installed(.RubikMedium), size: .custom(33)).instance,
                                                                         .foregroundColor: ColorPalette.green])
            let priceCurrAttr = NSAttributedString(string: " ₽", attributes: [.font: Font(.installed(.RobotoRegular), size: .custom(16)).instance,
                                                                             .foregroundColor: ColorPalette.gray5])
            priceAttr.append(priceCurrAttr)
            priceLabel.attributedText = priceAttr

            let discPriceAttr = NSAttributedString(string: "\(viewModel.price.withSpacesWithoutCoins())₽",
                                                          attributes: [.font: Font(.installed(.RubikRegular), size: .custom(12)).instance,
                                                                       .foregroundColor: ColorPalette.gray2,
                                                                       .strikethroughStyle: 1])
            discountPriceLabel.attributedText = discPriceAttr
            
            let discAttr = String(format: NSLocalizedString("productDetailDiscount", comment: ""), "7%").htmlToAttributedString
            discountLabel.attributedText = discAttr

            let inStockAttr = String(format: NSLocalizedString("productDetailStock", comment: ""), "+ в 10 магазинах").htmlToAttributedString
            inStockLabel.attributedText = inStockAttr
        }
    }
}
