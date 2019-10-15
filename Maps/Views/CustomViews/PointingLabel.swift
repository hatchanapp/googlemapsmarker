//
//  PointingLabel.swift
//  Maps
//
//  Created by hatchanapp on 13/10/19.
//  Copyright © 2019 hatchanapp. All rights reserved.
//

import UIKit

class PointingLabel : UIView {
    
    private let popupColor = UIColor(white: 0.0, alpha: 0.16)
    private let drawingCornerRadius: CGFloat = 6.0
    private let bubbleHeightRatio: CGFloat = 0.83
    
    let label = UILabel()
    
    var text: String
    
    init(withText text: String, font: UIFont = UIFont.systemFont(ofSize: 18.0)) {
        
        self.text = text
        label.font = font
        
        let height = text.height(withConstrainedWidth: CGFloat.greatestFiniteMagnitude, font: font)
        let width = text.width(withConstrainedHeight: CGFloat.greatestFiniteMagnitude, font: font)
        
        super.init(frame: CGRect(x: 0, y: 0, width: width + 20, height: height + 10))
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        
        backgroundColor = UIColor.clear
        
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -drawingCornerRadius/2).isActive = true
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        label.textAlignment = .center
        label.text = self.text
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func draw(_ rect: CGRect) {
        
        let bubbleHeight: CGFloat = round( frame.size.height * bubbleHeightRatio )
        let pointWidth: CGFloat = frame.size.width * 0.07
        let horizontalCenter: CGFloat = frame.size.width * 0.5
        
        let context = UIGraphicsGetCurrentContext()
        
        //----- Path Drawing --------
        
        //Start at Center-top
        context?.move(to: CGPoint(x: horizontalCenter, y: 0.0))
        context?.addLine(to: CGPoint(x: frame.width - drawingCornerRadius , y: 0))
        
        //Draw curve around right corner, then down
        context?.addArc(center: CGPoint(x: frame.width - drawingCornerRadius, y: drawingCornerRadius),
                        radius: drawingCornerRadius , startAngle: CGFloat.pi / 2.0 * 3.0 , endAngle: 0.0 , clockwise: false)
        
        context?.addLine(to: CGPoint(x: frame.width, y: bubbleHeight - drawingCornerRadius))
        
        //bottom right corner and to the edge of the point
        context?.addArc(center: CGPoint(x: frame.width - drawingCornerRadius ,y: bubbleHeight - drawingCornerRadius ),
                        radius: drawingCornerRadius, startAngle: 0.0 , endAngle: CGFloat.pi / 2.0 , clockwise: false)
        
        context?.addLine(to: CGPoint(x: horizontalCenter + pointWidth, y: bubbleHeight))
        
        //Point
        context?.addLine(to: CGPoint(x: horizontalCenter, y: frame.height))
        context?.addLine(to: CGPoint(x: horizontalCenter - pointWidth, y: bubbleHeight))
        context?.addLine(to: CGPoint(x: drawingCornerRadius, y: bubbleHeight))
        
        //Left Bottom corner and up
        context?.addArc(center: CGPoint(x: drawingCornerRadius , y: bubbleHeight - drawingCornerRadius),
                        radius: drawingCornerRadius, startAngle: CGFloat.pi * 3.0 / 2.0, endAngle: CGFloat.pi , clockwise: false)
        
        context?.addLine(to: CGPoint(x: 0, y: drawingCornerRadius))
        
        //Topcorner and back to the top center
        context?.addArc(center: CGPoint(x: drawingCornerRadius, y: drawingCornerRadius),
                        radius: drawingCornerRadius, startAngle: CGFloat.pi , endAngle: 3 * CGFloat.pi / 2 , clockwise: false)
        
        context?.addLine(to: CGPoint(x: horizontalCenter, y: 0))
        //END Path drawing ---------
        
        
        context?.setFillColor(popupColor.cgColor)
        context?.drawPath(using: CGPathDrawingMode.fill)
        
    }
    
}
