//
//  PhotoCollectionViewCell.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setImage(_ image: String) {
        if let url = URL(string: image), image.prefix(4) == "http" {
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = UIImage(named: image)
        }
    }
    
    private func setupViews() {
        contentView.addSubview(imageView)
        imageView.anchor(top: contentView.topAnchor,
                         leading: contentView.leadingAnchor,
                         bottom: contentView.bottomAnchor,
                         trailing: contentView.trailingAnchor)
    }
}
