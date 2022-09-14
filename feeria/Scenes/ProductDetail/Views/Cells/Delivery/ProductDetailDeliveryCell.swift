//
//  ProductDetailDeliveryCell.swift
//  feeria
//
//  Created by ios1 on 23.08.22.
//

import UIKit

class ProductDetailDeliveryCell: UITableViewCell, ProductDetailDeliveryCellProtocol {
    
    @IBOutlet private weak var deliveryRegionLabel: UILabel!
    @IBOutlet private weak var todayDeliveryLabel: UILabel!
    @IBOutlet private weak var tomorrowDeliveryLabel: UILabel!
    
    var viewModel: ProductDetailDeliveryCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        
    }
    
    private func setupBindables() {
        if let viewModel = viewModel {
            
            deliveryRegionLabel.attributedText = String(format: NSLocalizedString("productDetailDeliveryRegion", comment: ""),
                                                        "Москве", " в пределах МКАД").htmlToAttributedString
            todayDeliveryLabel.attributedText = String(format: NSLocalizedString("productDetailTodayDeliveryPrice", comment: ""),
                                                       "300 рублей").htmlToAttributedString
            tomorrowDeliveryLabel.attributedText = String(format: NSLocalizedString("productDetailTomorrowDeliveryPrice", comment: ""),
                                                          "БЕСПЛАТНО").htmlToAttributedString
        }
    }
}
