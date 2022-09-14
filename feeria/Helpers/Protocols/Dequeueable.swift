//
//  Dequeueable.swift
//  feeria
//
//  Created by ios1 on 11.08.22.
//

import UIKit

protocol Dequeueable {

    static var dequeueIdentifier: String { get }

}

extension Dequeueable where Self: UIView {

    static var dequeueIdentifier: String {
        return String(describing: self)
    }

}

extension UITableViewCell: Dequeueable { }

extension UITableViewHeaderFooterView: Dequeueable { }

extension UICollectionReusableView: Dequeueable { }
