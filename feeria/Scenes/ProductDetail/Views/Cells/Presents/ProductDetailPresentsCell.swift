//
//  ProductDetailPresentsCell.swift
//  feeria
//
//  Created by ios1 on 5.09.22.
//

import UIKit

class ProductDetailPresentsCell: UITableViewCell, ProductDetailPresentsCellProtocol {
    
    @IBOutlet weak var titleBackgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: ProductDetailPresentsCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(cellType: PresentCollectionViewCell.self)
        
        setupUI()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        let defaultSize = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
        // 82 is sum of left right insets
        collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: 10000)
        collectionView.layoutIfNeeded()
        var collectionViewSize = collectionView.collectionViewLayout.collectionViewContentSize
        collectionViewSize.width += defaultSize.width
        collectionViewSize.height += defaultSize.height
        return collectionViewSize
    }
    
    private func setupUI() {
        selectionStyle = .none
        
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        contentView.backgroundColor = ColorPalette.lightGreenBackground
        titleBackgroundView.backgroundColor = ColorPalette.greenBackground
        
        titleLabel.attributedText = NSLocalizedString("productDetailPresentsTitle", comment: "").htmlToAttributedString
    }
    
    private func setupBindables() {
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }
}

extension ProductDetailPresentsCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.presents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: PresentCollectionViewCell.self, for: indexPath)
        if let viewModel = viewModel {
            cell.configure(with: viewModel.presents[indexPath.row])
        }
        return cell
    }
}

extension ProductDetailPresentsCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 40) / 3
        return CGSize(width: width, height: width * 1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
