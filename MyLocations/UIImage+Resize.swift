//
//  UIImage+Resize.swift
//  MyLocations
//
//  Created by Melanie Kramer on 2/14/21.
//  Copyright © 2021 Melanie Kramer. All rights reserved.
//

import UIKit

extension UIImage {
    // calculate how bit image should be to fit bounds of thumbnail
    // create new image context and draw image to that
    func resized(withBounds bounds: CGSize) -> UIImage {
        let horizontalRatio = bounds.width / size.width
        let verticalRatio = bounds.height / size.height
        let ratio = min(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: size.width * ratio,
                             height: size.height * ratio)
        
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
