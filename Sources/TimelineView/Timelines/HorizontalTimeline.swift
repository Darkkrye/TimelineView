//
//  HorizontalTimeline.swift
//  
//
//  Created by Pierre on 26/10/2019.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
class HorizontalTimeline: UIStackView {
    private var timePoints: [HorizontalTimePoint] = []
    private var stacks: [UIStackView] = []
    private var hasTopLabel: Bool = false
    private var hasBottomLabel: Bool = false
    
    init(timePoints: [HorizontalTimePoint]) {
        self.timePoints = timePoints
        
        // Check for labels
        for timePoint in timePoints {
            if timePoint.firstLabel != nil {
                self.hasTopLabel = true
                
                if self.hasBottomLabel { break }
            }
            
            if timePoint.secondLabel != nil {
                self.hasBottomLabel = true
                
                if self.hasTopLabel { break }
            }
        }
        
        self.timePoints[self.timePoints.count - 1].lineColor = .clear // Remove the last line
        
        super.init(frame: .zero)
        self.setView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.alignment = .fill
        
        self.stacks = self.timePoints.map { (_) -> UIStackView in
            let stackView = UIStackView()
            
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            
            return stackView
        }
        
        for s in self.stacks {
            self.addArrangedSubview(s)
        }
    }
    
    private func updateViews() {
        self.layoutIfNeeded()
        
        guard self.stacks.count == self.timePoints.count else {
            print("Error during rendering timeline. Stacks: \(self.stacks.count) - TimePoints: \(self.timePoints.count)")
            return
        }
        
        for (stack, timePoint) in zip(self.stacks, self.timePoints) {
            if stack.frame != .zero {
                var division: CGFloat = 1
                division += self.hasTopLabel ? 1 : 0
                division += self.hasBottomLabel ? 1 : 0
                
                // Top Label
                if self.hasTopLabel {
                    stack.addArrangedSubview(timePoint.firstLabel ?? UILabel())
                }
                
                // TimePoint
                stack.addArrangedSubview(TimelineItem(from: timePoint, frame: CGRect(x: 0, y: 0, width: stack.frame.width, height: stack.frame.height / division)))
                
                // Bottom Label
                if self.hasBottomLabel {
                    stack.addArrangedSubview(timePoint.secondLabel ?? UILabel())
                }
            }
        }
    }
    
    override func layoutSubviews() {
        // TODO: Manage multiple execution
        self.updateViews()
    }
}
