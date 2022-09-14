//
//  ProductDetailPaymentMethodsCell.swift
//  feeria
//
//  Created by ios1 on 1.09.22.
//

import UIKit

class ProductDetailPaymentMethodsCell: UITableViewCell {
    
    @IBOutlet private weak var willLaunchForYouLabel: UILabel!
    @IBOutlet private weak var paymentMethodsLabel: UILabel!
    @IBOutlet private weak var ifFailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        setupLocalizables()
    }
    
    private func setupUI() {
        selectionStyle = .none
        
        willLaunchForYouLabel.font = Font(.installed(.RubikRegular), size: .standard(.h3)).instance
        willLaunchForYouLabel.textColor = ColorPalette.mainAppColor
        
        paymentMethodsLabel.font = Font(.installed(.RubikBold), size: .standard(.h4)).instance
        paymentMethodsLabel.textColor = .black
    }
    
    private func setupLocalizables() {
        willLaunchForYouLabel.text = NSLocalizedString("productDetailWillFireForYou", comment: "")
        paymentMethodsLabel.text = NSLocalizedString("productDetailAvailablePayments", comment: "")
        ifFailLabel.attributedText = NSLocalizedString("productDetailIfFail", comment: "").htmlToAttributedString
    }
}


