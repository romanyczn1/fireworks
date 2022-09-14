//
//  ProductDetailHowToLaunchCell.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import UIKit

class ProductDetailHowToLaunchCell: UITableViewCell, ProductDetailHowToLaunchCellProtocol {
    
    private let serialNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Font(.installed(.RobotoBold), size: .standard(.h3)).instance
        label.setContentHuggingPriority(UILayoutPriority(252), for: .horizontal)
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var viewModel: ProductDetailHowToLaunchCellViewModelProtocol? {
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
        
        self.addSubview(serialNumberLabel)
        self.addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            serialNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 13),
            serialNumberLabel.firstBaselineAnchor.constraint(equalTo: infoLabel.firstBaselineAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 33),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -13),
            infoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
        ])
    }
    
    private func setupBindables() {
        if let viewModel = viewModel {
            
            self.serialNumberLabel.text = "\(viewModel.serialNumber)"
            self.infoLabel.text = viewModel.rule
        }
    }
}
