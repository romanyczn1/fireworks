//
//  ProductDetailHowToLaunchFooterView.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import UIKit

class ProductDetailHowToLaunchFooterView: UITableViewHeaderFooterView {
    
    private let moreButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = Font(.installed(.RobotoRegular), size: .standard(.h5)).instance
        btn.setTitleColor(ColorPalette.mainAppColor, for: .normal)
        btn.setTitle(NSLocalizedString("more", comment: ""), for: .normal)
        return btn
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let view = UIView()
        view.backgroundColor = .white
        backgroundView = view
        
        contentView.addSubview(moreButton)
        
        NSLayoutConstraint.activate([
            moreButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            moreButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 33),
            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -21)
        ])
    }
}
