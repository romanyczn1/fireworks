//
//  ProductDetailPostOrderInfoCell.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import UIKit

class ProductDetailPostOrderInfoCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var callbackLabel: UILabel!
    @IBOutlet weak var packOrderLabel: UILabel!
    @IBOutlet weak var courierLabel: UILabel!
    @IBOutlet weak var leaveReviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        setupLocalizables()
    }
    
    private func setupUI() {
        selectionStyle = .none
        
        titleLabel.font = Font(.installed(.RubikMedium), size: .standard(.h1)).instance
    }
    
    private func setupLocalizables() {
        titleLabel.text = NSLocalizedString("productDetailPostOrderTitle", comment: "")
        callbackLabel.attributedText = NSLocalizedString("productDetailPostOrderCallbackInfo", comment: "").htmlToAttributedString
        packOrderLabel.attributedText = NSLocalizedString("productDetailPostOrderPackOrderInfo", comment: "").htmlToAttributedString
        courierLabel.attributedText = NSLocalizedString("productDetailPostOrderCourierInfo", comment: "").htmlToAttributedString
        leaveReviewLabel.attributedText = NSLocalizedString("productDetailPostOrderLeaveReviewInfo", comment: "").htmlToAttributedString
    }
}
