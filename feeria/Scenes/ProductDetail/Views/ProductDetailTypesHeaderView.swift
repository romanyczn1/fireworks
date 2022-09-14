//
//  ProductDetailTypesHeaderView.swift
//  feeria
//
//  Created by ios1 on 6.09.22.
//

import UIKit

protocol ProductDetailTypesHeaderViewDelegate: AnyObject {
    func newTypeSelected(_ type: ProductDetailViewSection)
}

class ProductDetailTypesHeaderView: UITableViewHeaderFooterView {
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillProportionally
        return sv
    }()
    
    weak var delegate: ProductDetailTypesHeaderViewDelegate?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(selectedType: ProductDetailViewSection, with types: [ProductDetailViewSection]) {
        
        for type in types {
            let btn = SectionTypedButton(type: type)
            btn.setTitleColor(selectedType == type ? UIColor.black : UIColor.gray, for: .normal)
            btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            stackView.addArrangedSubview(btn)
        }
    }
    
    private func setupViews() {
        let view = UIView()
        view.backgroundColor = .white
        backgroundView = view
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    @objc private func buttonTapped(sender: Any) {
        if let btn = sender as? SectionTypedButton {
            delegate?.newTypeSelected(btn.type)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        for view in stackView.arrangedSubviews {
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}

fileprivate class SectionTypedButton: UIButton {
    
    let type: ProductDetailViewSection
        
    init(type: ProductDetailViewSection) {
        self.type = type
        
        super.init(frame: .zero)
        
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.font = Font(.installed(.RubikRegular), size: .standard(.h4)).instance
        self.setTitle(type.name, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
