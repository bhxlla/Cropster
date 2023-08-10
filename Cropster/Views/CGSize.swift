//
//  CGSize.swift
//  Cropster
//
//  Created by Varun on 05/08/23.
//

import Foundation

extension CGSize {
    func sizeWith(ratio: CGFloat) -> CGSize {
        
        let currentRatio = width / height
        let desiredRatio = ratio

        var newWidth: CGFloat
        var newHeight: CGFloat

        if currentRatio > desiredRatio {
            newWidth = height * desiredRatio
            newHeight = height
        } else {
            newWidth = width
            newHeight = width / desiredRatio
        }

        return CGSize(width: newWidth, height: newHeight)
    }
    
    static func same(_ value: CGFloat) -> Self { .init(width: value, height: value) }
    
    var toPoint: CGPoint { .init(x: width, y: height) }
    
}
