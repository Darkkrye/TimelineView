//
//  HorizontalTimePoint.swift
//  
//
//  Created by Pierre on 26/10/2019.
//

import Foundation
import UIKit

public class HorizontalTimePoint: TimelinePoint {
    public init(diameter: CGFloat = 15, strokeWidth: CGFloat = 2, strokeColor: UIColor = .clear, fillColor: UIColor = .clear, lineWidth: CGFloat = 2, lineColor: UIColor = .clear, topLabel: UIView? = nil, bottomLabel: UIView? = nil) {
        super.init(diameter: diameter, strokeWidth: strokeWidth, strokeColor: strokeColor, fillColor: fillColor, lineWidth: lineWidth, lineColor: lineColor, firstLabel: topLabel, secondLabel: bottomLabel)
    }
}
