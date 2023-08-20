//
//  CustomZoomPanView.swift
//  Cropster
//
//  Created by Varun on 05/08/23.
//

import UIKit
import SwiftUI

struct ZoomPanView: UIViewRepresentable {
    
    @Binding var image: UIImage
    @Binding var offset: CGSize
    @Binding var scale: CGFloat
    var setOffsetAndScale:(CGPoint, CGFloat) -> ()
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.imageView.image = image
//        uiView.setFrame(offset: offset.toPoint, scale: scale)
        UIView.transition(with: uiView, duration: 0.25) {
            uiView.setFrame(offset: offset.toPoint, scale: scale)
        }
    }
    
    
    func makeUIView(context: Context) -> some ZoomPan {
        ZoomPan(image: image, offset: offset.toPoint, scale: scale, setOffsetAndScale: setOffsetAndScale)
    }
        
}


class ZoomPan: UIView, UIScrollViewDelegate {
    
    var image: UIImage
    var offset: CGPoint
    var scale: CGFloat
    var setOffsetAndScale:(CGPoint, CGFloat) -> ()
    
    lazy var imageView: UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    lazy var imageScrollView: UIScrollView = {
        let v = UIScrollView.init(frame: .zero)
        v.backgroundColor = .systemPink
        v.isScrollEnabled = true
        v.bounces = false
        v.bouncesZoom = false
        v.showsVerticalScrollIndicator = false
        v.showsHorizontalScrollIndicator = false
        v.delegate = self
        v.maximumZoomScale = 2.0
        v.minimumZoomScale = 1.0
        
        v.clipsToBounds = false
        v.layer.masksToBounds = false
        return v
    }()
    
    init(
        image: UIImage,
        offset: CGPoint,
        scale: CGFloat,
        setOffsetAndScale: @escaping (CGPoint, CGFloat) -> ()
    ) {
        self.image = image
        self.offset = offset
        self.scale = scale
        self.setOffsetAndScale = setOffsetAndScale
        super.init(frame: .zero)

        addSubview(imageScrollView)
        imageScrollView.addSubview(imageView)
        backgroundColor = .systemTeal
    }
        
    
    
}
