//
//  CGPoint.swift
//  Cropster
//
//  Created by Varun on 05/08/23.
//

import Foundation

extension CGPoint {
    var toSize: CGSize { .init(width: x, height: y) }
}
