//
//  Transitionable.swift
//  feeria
//
//  Created by ios1 on 3.08.22.
//

import UIKit

protocol Transitionable: UIViewController {

    var transitionContainerView: UIView! { get }

}

protocol TransitionableInitiator: UIViewController {}
