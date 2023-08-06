//
//  CollageRatios.swift
//  Cropster
//
//  Created by Varun on 05/08/23.
//

import Foundation

enum Ratios {
    case constants(FrameRatios)
    case original(CGFloat)

    var ratio: CGFloat {
        switch self {
        case .constants(let frameRatios):
            return frameRatios.value
        case .original(let cGFloat):
            return cGFloat
        }
    }
    
    var label: String {
        switch self {
        case .constants(let frameRatios):
            return frameRatios.label
        case .original(_):
            return "Original"
        }
    }
        
}

extension Ratios: Equatable {
    
}

enum FrameRatios: CaseIterable {
    
    case _1x1
    
    case _9x16
    case _4x5
    case _5x7
    case _3x4
    case _3x5
    case _2x3

    case _16x9
    case _5x4
    case _7x5
    case _4x3
    case _5x3
    case _3x2
    
    var value: CGFloat {
        switch self {
        case ._1x1: return 1
        case ._9x16: return 9/16
        case ._4x5: return 4/5
        case ._5x7: return 5/7
        case ._3x4: return 3/4
        case ._3x5: return 3/5
        case ._2x3: return 2/3
        case ._16x9: return 16/9
        case ._5x4: return 5/4
        case ._7x5: return 7/5
        case ._4x3: return 4/3
        case ._5x3: return 5/3
        case ._3x2: return 3/2

        }
    }
    
    var label: String {
        switch self {
            case ._1x1: return "1 x 1"
            case ._9x16: return "9 x 16"
            case ._4x5: return "4 x 5"
            case ._5x7: return "5 x 7"
            case ._3x4: return "3 x 4"
            case ._3x5: return "3 x 5"
            case ._2x3: return "2 x 3"
            case ._16x9: return "16 x 9"
            case ._5x4: return "5 x 4"
            case ._7x5: return "7 x 5"
            case ._4x3: return "4 x 3"
            case ._5x3: return "5 x 3"
            case ._3x2: return "3 x 2"
        }
    }
    
}
