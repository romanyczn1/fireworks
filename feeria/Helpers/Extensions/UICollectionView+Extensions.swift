//
//  UICollectionView+Extensions.swift
//  feeria
//
//  Created by ios1 on 11.08.22.
//

import UIKit

extension UICollectionView {

    func isScrolledToTop() -> Bool {
        return contentOffset == .zero
    }

    func scrollToTop(animated: Bool) {
        setContentOffset(.zero, animated: animated)
    }

    // MARK: - Register

    func register<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let identifier = cellType.dequeueIdentifier
        register(cellType, forCellWithReuseIdentifier: identifier)
    }
    
    func register<T: UICollectionReusableView>(viewType: T.Type, kind: String, bundle: Bundle? = nil) {
        let identifier = viewType.dequeueIdentifier
        register(viewType, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
    }

    // MARK: - Nib Register

    func registerNib<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let identifier = cellType.dequeueIdentifier
        let nib = UINib(nibName: identifier, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    func registerNib<T: UICollectionReusableView>(viewType: T.Type, kind: String, bundle: Bundle? = nil) {
        let identifier = viewType.dequeueIdentifier
        let nib = UINib(nibName: identifier, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
    }

    // MARK: - Dequeuing

    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type.dequeueIdentifier, for: indexPath) as! T
    }

}
