//
//  SimpleCollectionViewHeaderView.swift
//  feeria
//
//  Created by ios1 on 11.08.22.
//

import UIKit

class SimpleCollectionViewHeaderView: UICollectionReusableView {
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = ColorPalette.gray1
        lbl.textAlignment = .left
        lbl.font = Font(.installed(.RubikRegular), size: .standard(.h1)).instance
        return lbl
    }()
    
    var headerTitle: String? {
        didSet {
            titleLabel.text = headerTitle
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        addSubview(titleLabel)
        
        titleLabel.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: bottomAnchor,
                          trailing: trailingAnchor,
                          padding: UIEdgeInsets(top: 24, left: 14, bottom: 10, right: 14))
    }
}
