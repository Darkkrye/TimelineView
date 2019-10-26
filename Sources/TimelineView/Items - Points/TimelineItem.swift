//
//  TimelineItem.swift
//  
//
//  Created by Pierre on 26/10/2019.
//

import Foundation
import UIKit

@IBDesignable
class TimelineItem: UIView {
    
    enum Direction {
        case horizontal, vertical
    }
    
    // Circle
    @IBInspectable var diameter: CGFloat = 15.0
    @IBInspectable var strokeWidth: CGFloat = 2.0
    @IBInspectable var strokeColor: UIColor = .clear
    @IBInspectable var fillColor: UIColor = .clear

    // Line
    @IBInspectable var lineWidth: CGFloat = 2.0
    @IBInspectable var lineColor: UIColor = .clear
    
    var direction: Direction = .horizontal
    
    init(from point: TimelinePoint, frame: CGRect, direction: Direction = .horizontal) {
        super.init(frame: frame)
        
        self.diameter = point.diameter
        self.strokeWidth = point.strokeWidth
        self.strokeColor = point.strokeColor
        self.fillColor = point.fillColor
        self.lineWidth = point.lineWidth
        self.lineColor = point.lineColor
        
        self.direction = direction
        
        layer.addSublayer(lineLayer())
        layer.addSublayer(circleLayer())
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func circleLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()

        shapeLayer.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diameter, height: diameter)).cgPath

        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = strokeWidth
        shapeLayer.position = CGPoint(x: bounds.midX - (diameter / 2.0), y: bounds.midY - (diameter / 2.0))

        return shapeLayer
    }

    func lineLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: 0))
        path.close()

        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.position = CGPoint(x: bounds.width / 2, y: bounds.height / 2.0)
        
        return shapeLayer
    }
}
