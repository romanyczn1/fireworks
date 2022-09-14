//
//  RetryPlaceHolderable.swift
//  feeria
//
//  Created by ios1 on 18.08.22.
//

import UIKit

typealias Placeholderable = Displayable & Detailable
typealias RetryPlaceHolderable = Displayable & Detailable & RetryActionable

protocol PlaceholderDisplayable: Retryable, Emptiable {}

extension PlaceholderDisplayable where Self: UIViewController {

    func hideDisplayedPlaceholderView() {
        hideEmptyView()
        hideRetryView()
    }

}
