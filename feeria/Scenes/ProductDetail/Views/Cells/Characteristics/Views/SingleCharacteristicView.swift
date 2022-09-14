//
//  SingleCharacteristicView.swift
//  feeria
//
//  Created by ios1 on 23.08.22.
//

import UIKit

class SingleCharacteristicView: UIView {
    
    private let valueLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = ColorPalette.gray1
        lbl.font = Font(.installed(.RubikMedium), size: .custom(17)).instance
        return lbl
    }()
    
    private let descLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = ColorPalette.gray3
        lbl.font = Font(.installed(.RubikRegular), size: .standard(.h5)).instance
        return lbl
    }()
    
    init(metric: String, value: String) {
        super.init(frame: .zero)
        
        descLabel.text = metric
        valueLabel.text = value
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder not implemented")
    }
    
    func setup(value: String, metric: String) {
        self.valueLabel.text = value
        self.descLabel.text = metric
    }
    
    private func setupViews() {
        addSubview(valueLabel)
        addSubview(descLabel)
        
        valueLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        valueLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        descLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        descLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: topAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            descLabel.leadingAnchor.constraint(equalTo: valueLabel.trailingAnchor, constant: 2),
            descLabel.lastBaselineAnchor.constraint(equalTo: valueLabel.lastBaselineAnchor),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
