//
//  CropsterView.swift
//  Cropster
//
//  Created by Varun on 05/08/23.
//

import SwiftUI

let PADDING = UIDevice.current.userInterfaceIdiom.padding

extension UIUserInterfaceIdiom {
    var padding: CGFloat {
        switch self {
            case .phone:
                return 90
            default:
                return 120
        }
    }
}

struct CropsterScreen: View {
    @Binding var image: UIImage?
    
    var body: some View {
        if image == nil {
            EmptyView()
        } else {
            CropsterView(image: .constant(image!))
        }
    }
    
}

struct CropsterView: View {
    
//    var screenWidth: CGFloat { UIScreen.main.bounds.width}
    
    @Binding var image: UIImage
    
    @State var size: CGSize = .init(
        width: UIScreen.main.bounds.width - PADDING,
        height: UIScreen.main.bounds.width - PADDING
    )
    
    var body: some View {
        VStack {
            imageView

        }
    }
    
    }
    
    
    var imageView: some View {
        let sizeWithAspectRatio = sizeOfRatio
        return VStack {
        }
        }
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.width)
        .clipped()
    }
    
}


struct CropsterView_Previews: PreviewProvider {
    static var previews: some View {
        CropsterView(image: .constant(.init(named: "pic1")!))
            .preferredColorScheme(.dark)
    }
}
