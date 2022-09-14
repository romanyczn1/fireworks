//
//  BadgedLabel.swift
//  feeria
//
//  Created by ios1 on 15.08.22.
//

import UIKit

class BadgedLabel: UILabel {

    var topInset: CGFloat = 4.0
    var bottomInset: CGFloat = 4.0
    var leftInset: CGFloat = 4.0
    var rightInset: CGFloat = 4.0
    
    var cornerRadius: CGFloat = 4.0
    var badgeCornerHeight: CGFloat = 4.0

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset + badgeCornerHeight, right: rightInset)
        let insetRect = rect.inset(by: insets)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + 1))
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + 1))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 1, y: rect.minY + 1 + cornerRadius), control: CGPoint(x: rect.maxX - 1, y: rect.minY + 1))
        path.addLine(to: CGPoint(x: rect.maxX - 1, y: rect.maxY - cornerRadius - badgeCornerHeight))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 1 - cornerRadius, y: rect.maxY - badgeCornerHeight), control: CGPoint(x: rect.maxX - 1, y: rect.maxY - badgeCornerHeight))
        path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - badgeCornerHeight))
        path.addLine(to: CGPoint(x: rect.minX + 1, y: rect.maxY - 1))
        path.addLine(to: CGPoint(x: rect.minX + 1, y: rect.minY + cornerRadius))
        path.addQuadCurve(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + 1), control: CGPoint(x: rect.minX + 1, y: rect.minY + 1))
        path.closeSubpath()
        
        context.addPath(path)
        context.clip()
        context.setFillColor(UIColor(rgb: 0xE0E0E0, alpha: 0.5).cgColor)
        context.fill(CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
        
        context.addPath(path)
        context.setStrokeColor(UIColor(rgb: 0x000000, alpha: 0.2).cgColor)
        context.strokePath()
        
        super.drawText(in: insetRect)
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset + badgeCornerHeight)
    }

    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}
