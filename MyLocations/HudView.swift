//
//  HudView.swift
//  MyLocations
//
//  Created by Melanie Kramer on 2/11/21.
//  Copyright © 2021 Melanie Kramer. All rights reserved.
//

import UIKit

class HudView: UIView {
    var text = ""
    
    class func hud(inView view: UIView,
                   animated: Bool) -> HudView {
        let hudView = HudView(frame: view.bounds)
        hudView.isOpaque = false
        view.addSubview(hudView)
        // view unresponsive
        view.isUserInteractionEnabled = false
        
        //hudView.backgroundColor = UIColor(red: 1, green: 0, blue: 0,
                            // alpha: 0.5)
        // call animation
        hudView.show(animated: animated)
        return hudView
    }
    
    // draw a filled rectangle with rounded corners in center
    // of screen
    override func draw(_ rect: CGRect) {
        let boxWidth: CGFloat = 96
        let boxHeight: CGFloat = 96
        
        let boxRect = CGRect(
            // calculate position
            // round to make sure rect doesn't end up on fractional
            // pixel boundary which makes image look fuzzy
            x: round((bounds.size.width - boxWidth) / 2),
            y: round((bounds.size.height - boxHeight) / 2),
            width: boxWidth,
            height: boxHeight)
        let roundedRect = UIBezierPath(roundedRect: boxRect,
                                       cornerRadius: 10)
        UIColor(white: 0.3, alpha: 0.8).setFill()
        roundedRect.fill()
        
        // draw checkmark
        if let image = UIImage(named: "Checkmark") {
            let imagePoint = CGPoint(
                x: center.x - round(image.size.width / 2),
                y: center.y - round(image.size.height / 2) - boxHeight / 8)
            image.draw(at: imagePoint)
            
            // draw the text
            let attribs = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                NSAttributedString.Key.foregroundColor: UIColor.white ]
            let textSize = text.size(withAttributes: attribs)
            let textPoint = CGPoint(
                x: center.x - round(textSize.width / 2),
                y: center.y - round(textSize.height / 2) + boxHeight / 4)
            
            text.draw(at: textPoint, withAttributes: attribs)
        }
    }
    
    //MARK:- Public methods
    func show(animated: Bool) {
        if animated {
            // 1, fully transparent
            alpha = 0
            // scale a bit larger than normal
            transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            // 2
            // call to set up animation
            UIView.animate(withDuration: 0.3, delay: 0,
                           usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5,
                           options: [], animations: {
                // 3
                // alpha is 1, fully opaque
                self.alpha = 1
                // restore scale back to normal
                self.transform = CGAffineTransform.identity
                           }, completion: nil)
        }
    }
    
    func hide() {
        superview?.isUserInteractionEnabled = true
        removeFromSuperview()
    }
}
