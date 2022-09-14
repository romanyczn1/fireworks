//
//  ProductCell.swift
//  feeria
//
//  Created by ios1 on 15.08.22.
//

import UIKit

class ProductCell: UICollectionViewCell, ProductCellProtocol, NibLoadable {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var commentsLabel: BadgedLabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var chargeCountLabel: UILabel!
    @IBOutlet weak var chargeLabel: UILabel!
    
    @IBOutlet weak var inchesCountLabel: UILabel!
    @IBOutlet weak var inchesLabel: UILabel!
    
    @IBOutlet weak var timeCountLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var actualPriceLabel: UILabel!
    
    @IBOutlet weak var cartButton: UIButton!
    
    var viewModel: ProductCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCV()
        setupUI()
        setupLocalizables()
    }
    
    private func setupBindables() {
        if let viewModel = viewModel {
            nameLabel.text = viewModel.name
            ratingLabel.text = "\(viewModel.raiting)"
            productImageView.image = UIImage(named: viewModel.image)
            commentsLabel.text = "\(viewModel.commentsCount)"
            chargeCountLabel.text = "\(viewModel.chargesCount)"
            inchesCountLabel.text = "\(viewModel.inchesCount.withSpaces(decimalSeparator: ","))"
            timeCountLabel.text = "\(viewModel.timeCount)"
            priceLabel.text = "\((viewModel.price * (1 - viewModel.discount)).withSpacesWithoutCoins()) ₽"
            discountLabel.text = "-\((viewModel.discount * 100).withSpacesWithoutCoins())%"
            actualPriceLabel.attributedText = NSAttributedString(string: "\(viewModel.price.withSpaces()) ₽", attributes: [.strikethroughStyle: 1])
        }
    }
}

extension ProductCell {
    
    private func setupCV() {
        if let layout = photosCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 0.5
            layout.minimumInteritemSpacing = 0.5
        }
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
        photosCollectionView.register(cellType: UICollectionViewCell.self, bundle: nil)
    }
    
    private func setupUI() {
        nameLabel.font = Font(.installed(.RobotoRegular), size: .custom(11.56)).instance
        nameLabel.textColor = ColorPalette.gray1
        
        ratingLabel.font = Font(.installed(.RobotoBold), size: .custom(15)).instance
        ratingLabel.textColor = ColorPalette.gray1
        
        commentsLabel.font = Font(.installed(.RobotoLight), size: .standard(.h6)).instance
        commentsLabel.textColor = ColorPalette.gray1
        
        chargeCountLabel.font = Font(.installed(.RobotoBold), size: .custom(14.11)).instance
        chargeCountLabel.textColor = ColorPalette.gray1
        
        chargeLabel.font = Font(.installed(.RobotoRegular), size: .custom(11.22)).instance
        chargeLabel.textColor = ColorPalette.gray4
        
        inchesCountLabel.font = Font(.installed(.RobotoBold), size: .custom(14.11)).instance
        inchesCountLabel.textColor = ColorPalette.gray1
        
        inchesLabel.font = Font(.installed(.RobotoRegular), size: .custom(11.22)).instance
        inchesLabel.textColor = ColorPalette.gray4
        
        timeCountLabel.font = Font(.installed(.RobotoBold), size: .custom(14.11)).instance
        timeCountLabel.textColor = ColorPalette.gray1
        
        timeLabel.font = Font(.installed(.RobotoRegular), size: .custom(11.22)).instance
        timeLabel.textColor = ColorPalette.gray4
        
        priceLabel.font = Font(.installed(.RobotoBold), size: .custom(17.34)).instance
        priceLabel.textColor = ColorPalette.gray1
        
        discountLabel.font = Font(.installed(.RobotoMedium), size: .custom(10.11)).instance
        discountLabel.textColor = ColorPalette.gray4
        
        actualPriceLabel.font = Font(.installed(.RobotoMedium), size: .custom(10.11)).instance
        actualPriceLabel.textColor = ColorPalette.gray3
        
        cartButton.backgroundColor = ColorPalette.orange
        cartButton.layer.cornerRadius = 4
        cartButton.layer.masksToBounds = true
    }
    
    private func setupLocalizables() {
        chargeLabel.text = NSLocalizedString("chargesCount", comment: "")
        inchesLabel.text = NSLocalizedString("inchesCount", comment: "")
        timeLabel.text = NSLocalizedString("timeCount", comment: "")
    }
}

extension ProductCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: UICollectionViewCell.self, for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
}

extension ProductCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sideLength = (collectionView.bounds.height - 0.5) / 2
        return CGSize(width: sideLength, height: sideLength)
    }
}
