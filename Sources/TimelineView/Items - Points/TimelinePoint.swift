//
//  TimelinePoint.swift
//  
//
//  Created by Pierre on 26/10/2019.
//

import Foundation
import UIKit

public class TimelinePoint {
    // Circle
    var diameter: CGFloat
    var strokeWidth: CGFloat
    var strokeColor: UIColor
    var fillColor: UIColor

    // Line
    var lineWidth: CGFloat
    var lineColor: UIColor
    
    // Labels
    internal var firstLabel: UILabel?
    internal var secondLabel: UILabel?
    
    internal init(diameter: CGFloat = 15, strokeWidth: CGFloat = 2, strokeColor: UIColor = .clear, fillColor: UIColor = .clear, lineWidth: CGFloat = 2, lineColor: UIColor = .clear, firstLabel: UILabel? = nil, secondLabel: UILabel? = nil) {
        self.diameter = diameter
        self.strokeWidth = strokeWidth
        self.strokeColor = strokeColor
        self.fillColor = fillColor
        
        self.lineWidth = lineWidth
        self.lineColor = lineColor
        
        self.firstLabel = firstLabel
        self.secondLabel = secondLabel
    }
}
