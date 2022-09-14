//
//  UITableView+Extensions.swift
//  feeria
//
//  Created by ios1 on 17.08.22.
//

import UIKit

extension UITableView {

    // MARK: - Cell Register

    func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let identifier = cellType.dequeueIdentifier
        register(cellType, forCellReuseIdentifier: identifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(viewType: T.Type, bundle: Bundle? = nil) {
        let identifier = viewType.dequeueIdentifier
        register(viewType, forHeaderFooterViewReuseIdentifier: identifier)
    }

    // MARK: - Nib Register

    func registerNib<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let identifier = cellType.dequeueIdentifier
        let nib = UINib(nibName: identifier, bundle: bundle)
        register(nib, forCellReuseIdentifier: identifier)
    }

    // MARK: - Dequeuing

    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.dequeueIdentifier, for: indexPath) as! T
    }

    // MARK: - Header

    func configureDynamicHeaderViewHeight() {
        guard let headerView = tableHeaderView else { return }
        let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var headerFrame = headerView.frame

        // Comparison needed to avoid an infinite loop
        if height != headerFrame.size.height {
            headerFrame.size.height = height
            headerView.frame = headerFrame
            tableHeaderView = headerView
        }
    }

}
