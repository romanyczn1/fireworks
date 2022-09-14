//
//  ShopCollectionViewFooterView.swift
//  feeria
//
//  Created by ios1 on 15.08.22.
//

import UIKit

class ShopCollectionViewFooterView: UICollectionReusableView, NibLoadable {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var workingHoursLabel: UILabel!
    @IBOutlet weak var pymentDescLabel: UILabel!
    @IBOutlet weak var paymentMethodsLabel: UILabel!
    @IBOutlet weak var cashImageView: UIImageView!
    @IBOutlet weak var terminalImageView: UIImageView!
    @IBOutlet weak var mirIMageView: UIImageView!
    @IBOutlet weak var mastercardImageView: UIImageView!
    @IBOutlet weak var visaImageView: UIImageView!
    @IBOutlet weak var aboutLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        setupLocalizables()
    }
    
    @IBAction func cityTapped(_ sender: Any) {
    }
    
}

extension ShopCollectionViewFooterView {
    
    private func setupUI() {
        self.backgroundColor = ColorPalette.gray1
        
        cityLabel.font = Font(.installed(.RubikLight), size: .standard(.h5)).instance
        cityLabel.textColor = ColorPalette.gray4
        
        cityButton.titleLabel?.font = Font(.installed(.RobotoRegular), size: .standard(.h5)).instance
        cityButton.setTitleColor(.white, for: .normal)
        
        phoneLabel.font = Font(.installed(.RubikRegular), size: .custom(21)).instance
        phoneLabel.textColor = .white
        
        workingHoursLabel.font = Font(.installed(.RubikRegular), size: .custom(13.5)).instance
        workingHoursLabel.textColor = .white
        
        pymentDescLabel.font = Font(.installed(.RubikRegular), size: .standard(.h5)).instance
        pymentDescLabel.textColor = ColorPalette.gray4
        
        paymentMethodsLabel.font = Font(.installed(.RubikBold), size: .standard(.h5)).instance
        paymentMethodsLabel.textColor = ColorPalette.gray4
        
        aboutLabel.font = Font(.installed(.RubikRegular), size: .standard(.h5)).instance
        aboutLabel.textColor = .white
    }
    
    private func setupLocalizables() {
        cityLabel.text = NSLocalizedString("aboutYourCity", comment: "")
        pymentDescLabel.text = NSLocalizedString("aboutPaymentDescription", comment: "")
        paymentMethodsLabel.text = NSLocalizedString("aboutAvailablePayments", comment: "")
        aboutLabel.text = String(format: NSLocalizedString("aboutCreds", comment: ""), "\(Calendar.current.component(.year, from: Date()))")
    }
}
