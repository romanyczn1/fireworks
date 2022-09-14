//
//  ProductDetailCharacteristicsCell.swift
//  feeria
//
//  Created by ios1 on 23.08.22.
//

import UIKit

class ProductDetailCharacteristicsCell: UITableViewCell, ProductDetailCharacteristicsCellProtocol {
    
    @IBOutlet weak private var characteristicsStackView: UIStackView!
    @IBOutlet weak private var additionalInfoLabel: UILabel!
    
    private let characteristics: [UIView] = [
        SingleCharacteristicView(metric: "зарядов", value: "49"),
        SingleCharacteristicView(metric: "калибр (дюймы)", value: "1,25"),
        SingleCharacteristicView(metric: "высота (м.)", value: "35"),
        SingleCharacteristicView(metric: "динамичный", value: "Быстро-"),
        SingleCharacteristicView(metric: "время (мин)", value: "1:55"),
        SingleCharacteristicView(metric: "эффектов", value: "11")
    ]
    
    var viewModel: ProductDetailCharacteristicsCellViewModelProtocol? {
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
        
        for characteristic in characteristics {
            characteristicsStackView.addArrangedSubview(characteristic)
        }
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "eac")!
        let attachmentString = NSMutableAttributedString(attachment: attachment)
        let attachmentStringDsc = NSAttributedString(string: " сертифицировано")
        attachmentString.append(attachmentStringDsc)
        additionalInfoLabel.attributedText = attachmentString
    }
    
    private func setupBindables() {
        if let viewModel = viewModel {
            
            
        }
    }
}
