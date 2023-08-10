//
//  View.swift
//  Cropster
//
//  Created by Varun on 05/08/23.
//

import Foundation
import SwiftUI

extension View {

    @ViewBuilder
    func frame(_ size: CGSize) -> some View {
        self
            .frame(width: size.width, height: size.height)
    }
    

}
