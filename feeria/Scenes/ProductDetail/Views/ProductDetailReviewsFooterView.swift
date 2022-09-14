//
//  ProductDetailReviewsFooterView.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import UIKit

class ProductDetailReviewsFooterView: UITableViewHeaderFooterView {
    
    private let moreButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = Font(.installed(.RubikRegular), size: .standard(.h4)).instance
        btn.setTitleColor(ColorPalette.gray3, for: .normal)
        btn.setTitle(NSLocalizedString("showMore", comment: "").lowercased(), for: .normal)
        btn.setInsets(forContentPadding: .zero, imageTitlePadding: 0)
        return btn
    }()
    
    private let dashedView: CustomDashedView = {
        let view = CustomDashedView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dashColor = ColorPalette.gray3
        view.dashWidth = 2
        view.dashLength = 3
        view.betweenDashesSpace = 3
        return view
    }()
    
    private let addReviewButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = Font(.installed(.RubikRegular), size: .standard(.h4)).instance
        btn.setTitleColor(ColorPalette.mainAppColor, for: .normal)
        btn.setTitle(NSLocalizedString("productDetailAddReview", comment: ""), for: .normal)
        btn.setImage(UIImage(named: "add_review"), for: .normal)
        btn.setInsets(forContentPadding: .zero, imageTitlePadding: 7)
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
        contentView.addSubview(dashedView)
        contentView.addSubview(addReviewButton)
        
        let spacingConstraint = addReviewButton.topAnchor.constraint(equalTo: moreButton.bottomAnchor, constant: 15)
        spacingConstraint.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            moreButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            moreButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            dashedView.topAnchor.constraint(equalTo: moreButton.firstBaselineAnchor, constant: 4),
            dashedView.leadingAnchor.constraint(equalTo: moreButton.leadingAnchor),
            dashedView.trailingAnchor.constraint(equalTo: moreButton.trailingAnchor),
            dashedView.heightAnchor.constraint(equalToConstant: 2),
            
            spacingConstraint,
            addReviewButton.leadingAnchor.constraint(equalTo: moreButton.leadingAnchor),
            addReviewButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17.5)
        ])
    }
}
