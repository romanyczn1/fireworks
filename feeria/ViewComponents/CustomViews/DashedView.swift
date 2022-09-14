//
//  DashedView.swift
//  feeria
//
//  Created by ios1 on 7.09.22.
//

import UIKit

class CustomDashedView: UIView {

    var dashWidth: CGFloat = 2
    var dashColor: UIColor = .red
    var dashLength: CGFloat = 2
    var betweenDashesSpace: CGFloat = 3

    var dashBorder: CAShapeLayer?

    override func layoutSubviews() {
        super.layoutSubviews()
        dashBorder?.removeFromSuperlayer()
        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = dashWidth
        dashBorder.strokeColor = dashColor.withAlphaComponent(0.5).cgColor
        dashBorder.lineDashPattern = [dashLength, betweenDashesSpace] as [NSNumber]
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.minY), CGPoint(x: bounds.maxX, y: bounds.minY)])
        dashBorder.path = path
        layer.addSublayer(dashBorder)
        self.dashBorder = dashBorder
    }
}
