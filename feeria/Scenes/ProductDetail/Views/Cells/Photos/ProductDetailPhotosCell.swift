//
//  ProductDetailPhotosCell.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import UIKit

class ProductDetailPhotosCell: UITableViewCell, ProductDetailPhotosCellProtocol {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: ProductDetailPhotosCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: PhotoCollectionViewCell.self)
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        let defaultSize = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
        // 82 is sum of left right insets
        collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width - 82, height: 10000)
        collectionView.layoutIfNeeded()
        var collectionViewSize = collectionView.collectionViewLayout.collectionViewContentSize
        collectionViewSize.width += defaultSize.width
        collectionViewSize.height += defaultSize.height
        return collectionViewSize
    }
    
    private func setupBindables() {
        if let viewModel = viewModel {
            if let image = viewModel.images.first {
                productImageView.image = UIImage(named: image)
            }
            collectionView.reloadData()
            collectionView.layoutIfNeeded()
        }
    }
}

extension ProductDetailPhotosCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        let cell = collectionView.dequeueReusableCell(with: PhotoCollectionViewCell.self, for: indexPath)
        cell.setImage(viewModel.images[indexPath.item])
        return cell
    }
}

extension ProductDetailPhotosCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let image = viewModel?.images[indexPath.item] {
            productImageView.image = UIImage(named: image)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 56, height: 56)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
