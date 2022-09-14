//
//  ProductDetailDescriptionCell.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import UIKit

class ProductDetailDescriptionCell: UITableViewCell, ProductDetailDescriptionCellProtocol {
    
    private let infoLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var viewModel: ProductDetailDescriptionCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        selectionStyle = .none
        
        contentView.addSubview(infoLabel)

        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17.5),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17.5)
        ])
    }
    
    private func setupBindables() {
        if let viewModel = viewModel {
            
            let boldAttributes: [NSAttributedString.Key: Any] = [.font: Font(.installed(.RobotoBold), size: .standard(.h4)).instance]
            let regularAttributes: [NSAttributedString.Key: Any] = [.font: Font(.installed(.RobotoLight), size: .standard(.h4)).instance]
            
            let resultTextAttr = NSMutableAttributedString(string: "\(NSLocalizedString("description", comment: "")): ", attributes: boldAttributes)
            resultTextAttr.append(NSAttributedString(string: viewModel.description, attributes: regularAttributes))
            resultTextAttr.append(NSAttributedString(string: "\n\n\(NSLocalizedString("attention", comment: ""))! ", attributes: boldAttributes))
            resultTextAttr.append(NSAttributedString(string: viewModel.attention, attributes: regularAttributes))
            
            infoLabel.attributedText = resultTextAttr
        }
    }
}
