//
//  ProductDetailDesignCell.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import UIKit
 
class ProductDetailDesignCell: UITableViewCell, ProductDesignCellProtocol {
    
    private let designImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 9
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = Font(.installed(.RobotoRegular), size: .standard(.h3)).instance
        return lbl
    }()
    
    var viewModel: ProductDetailDesignCellViewModelProtocol? {
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
        
        contentView.addSubview(designImageView)
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            designImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            designImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            designImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            designImageView.heightAnchor.constraint(equalTo: designImageView.widthAnchor, multiplier: 268/343),
            
            label.topAnchor.constraint(equalTo: designImageView.bottomAnchor, constant: 21),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11.5),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -11.5),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -29)
        ])
    }
    
    private func setupBindables() {
        if let viewModel = viewModel {
            
            self.designImageView.image = UIImage(named: viewModel.image)
            self.label.text = viewModel.text
        }
    }
}
