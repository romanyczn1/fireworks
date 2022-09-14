//
//  DashedButton.swift
//  feeria
//
//  Created by ios1 on 19.08.22.
//

import UIKit

class DashedButton: UIButton {
    
    var dashWidth: CGFloat = 1
    var dashColor: UIColor = .red
    var dashLength: CGFloat = 4
    var betweenDashesSpace: CGFloat = 4

    var dashBorder: CAShapeLayer?

    override func layoutSubviews() {
        super.layoutSubviews()
        
        dashBorder?.removeFromSuperlayer()
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: bounds.minX + 5, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX - 5, y: bounds.minY))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX, y: bounds.minY + 5), control: CGPoint(x: bounds.maxX, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY - 5))
        path.addQuadCurve(to: CGPoint(x: bounds.maxX - 5, y: bounds.maxY), control: CGPoint(x: bounds.maxX, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.minX + 5, y: bounds.maxY))
        path.addQuadCurve(to: CGPoint(x: bounds.minX, y: bounds.maxY - 5), control: CGPoint(x: bounds.minX, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.minY + 5))
        path.addQuadCurve(to: CGPoint(x: bounds.minX + 5, y: bounds.minY), control: CGPoint(x: bounds.minX, y: bounds.minY))
        path.closeSubpath()
        
        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = dashWidth
        dashBorder.strokeColor = dashColor.withAlphaComponent(0.5).cgColor
        dashBorder.fillColor = UIColor.clear.cgColor
        dashBorder.lineDashPattern = [dashLength, betweenDashesSpace] as [NSNumber]
        dashBorder.path = path
        
        layer.addSublayer(dashBorder)
        
        self.dashBorder = dashBorder
    }
}
