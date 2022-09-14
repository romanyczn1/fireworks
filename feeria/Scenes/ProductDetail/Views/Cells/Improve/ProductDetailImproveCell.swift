//
//  ProductDetailImproveCell.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import UIKit

class ProductDetailImproveCell: UITableViewCell {
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "brainstorm_icon")
        return iv
    }()
    
    private let improveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSLocalizedString("productDetailImroveApp", comment: "").htmlToAttributedString, for: .normal)
        button.titleLabel?.numberOfLines = 0
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        selectionStyle = .none
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(improveButton)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 39),
            iconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            improveButton.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 13),
            improveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            improveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            improveButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -79)
        ])
    }
}
