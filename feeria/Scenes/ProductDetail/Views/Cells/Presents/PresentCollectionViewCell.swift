//
//  PresentCollectionViewCell.swift
//  feeria
//
//  Created by ios1 on 5.09.22.
//

import UIKit

class PresentCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with present: TempPresent) {
        self.nameLabel.text = present.name
        self.imageView.image = UIImage(named: present.image)
    }
    
    private func setupUI() {
        nameLabel.font = Font(.installed(.RobotoLight), size: .standard(.h4)).instance
    }
    
    private func setupViews() {
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 2),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
