//
//  ProductDetailPhotoCell.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import UIKit

class ProductDetailPhotoCell: UITableViewCell, ProductDetailPhotoCellProtocol {
    
    private let productImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    var viewModel: ProductDetailPhotoCellViewModelProtocol? {
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
        
        contentView.addSubview(productImageView)
        
        let aspectConstraint = productImageView.heightAnchor.constraint(equalTo: productImageView.widthAnchor, multiplier: 266/350)
        aspectConstraint.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            aspectConstraint
        ])
    }
    
    
    private func setupBindables() {
        if let viewModel = viewModel {
            productImageView.image = UIImage(named: viewModel.photo)
        }
    }
}
