//
//  UIView.swift
//  Cropster
//
//  Created by Varun on 05/08/23.
//

import Foundation
import UIKit

extension UIView {
    
    var width: CGFloat {
        size.width
    }
    
    var height: CGFloat {
        size.height
    }
    
    var size: CGSize {
        frame.size
    }
    
    var aspect: CGFloat {
        width / height
    }
    
}
