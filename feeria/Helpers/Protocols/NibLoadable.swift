//
//  NibLoadable.swift
//  feeria
//
//  Created by ios1 on 15.08.22.
//

import UIKit

protocol NibLoadable: AnyObject {

    static var nib: UINib { get }

}

extension NibLoadable {

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }

}

// MARK: - Support for instantiation from NIB

extension NibLoadable where Self: UIView {

    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        return view
    }

}
