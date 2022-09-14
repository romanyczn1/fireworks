//
//  SimpleTableViewHeaderView.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

import UIKit

class SimpleTableViewHeaderView: UITableViewHeaderFooterView {

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

    // MARK: - Initializers

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Private

    private func setupUI() {
        setupLabel()
    }

    private func setupLabel() {
        addSubview(titleLabel)
        
        titleLabel.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: bottomAnchor,
                          trailing: trailingAnchor,
                          padding: UIEdgeInsets(top: 24, left: 14, bottom: 10, right: 14))
    }

}
