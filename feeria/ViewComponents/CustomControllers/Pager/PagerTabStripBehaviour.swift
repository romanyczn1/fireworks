//
//  PagerTabStripBehaviour.swift
//  SalonsMaster
//
//  Created by ios1 on 23.03.22.
//  Copyright © 2022 ios. All rights reserved.
//

import Foundation

public enum PagerTabStripBehaviour {

    case common(skipIntermediateViewControllers: Bool)
    case progressive(skipIntermediateViewControllers: Bool, elasticIndicatorLimit: Bool)

    public var skipIntermediateViewControllers: Bool {
        switch self {
        case .common(let skipIntermediateViewControllers):
            return skipIntermediateViewControllers
        case .progressive(let skipIntermediateViewControllers, _):
            return skipIntermediateViewControllers
        }
    }

    public var isProgressiveIndicator: Bool {
        switch self {
        case .common:
            return false
        case .progressive:
            return true
        }
    }

    public var isElasticIndicatorLimit: Bool {
        switch self {
        case .common:
            return false
        case .progressive(_, let elasticIndicatorLimit):
            return elasticIndicatorLimit
        }
    }
}
