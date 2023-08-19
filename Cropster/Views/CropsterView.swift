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
    
    @State var offset: CGSize = .init(width: 0.5, height: 0.5)
    @State var scale: CGFloat = 1
    
    @State var selectedRatio: Ratios = .constants(._1x1)
    
    @State var radius: CGFloat = .zero
    
    var sizeOfRatio: CGSize {
        size.sizeWith(ratio: selectedRatio.ratio)
    }
    
    var minDimen: CGFloat {
        let sz = sizeOfRatio
        return min(sz.width, sz.height)
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            imageView

            buttons
                        
            slider
            Spacer()
            VStack {
                
                RatioPickerView(aspect: image.aspect, selected: $selectedRatio)
                    .padding(.vertical)

            }

        }
    }
    
    var buttons: some View {
        HStack {
            Button {
                withAnimation {
                    offset = .init(width: offset.width, height: 0.5)
                }
            } label: {
                Image(systemName: "align.vertical.center")
                    .font(.title)
                    .tint(Color(uiColor: .secondaryLabel))
            }
            
            Button {
                withAnimation {
                    offset = .init(width: 0.5, height: offset.height)
                }
            } label: {
                Image(systemName: "align.horizontal.center")
                    .font(.title)
                    .tint(Color(uiColor: .secondaryLabel))
                    .padding(.horizontal)
            }

            Button {
                withAnimation {
                    scale = 1
                }
            } label: {
                Image(systemName: "1.magnifyingglass")
                    .font(.title)
                    .tint(Color(uiColor: .secondaryLabel))
            }
        }
        .padding(.vertical)
    }
    
    var slider: some View {
        HStack {
            Button {
                withAnimation {
                    radius = 0
                }
            } label: {
                RoundedRectangle(cornerRadius: 0)
                    .stroke(lineWidth: 2)
                    .fill(Color(uiColor: .secondaryLabel))
                    .frame(.same(30).sizeWith(ratio: selectedRatio.ratio))
            }
            .frame(.same(30))

            
            Slider(value: $radius, in: 0...(minDimen/2))
                .padding(.horizontal)
            
            Button {
                withAnimation {
                    radius = minDimen/2
                }
            } label: {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke(lineWidth: 2)
                    .fill(Color(uiColor: .secondaryLabel))
                    .frame(.same(30).sizeWith(ratio: selectedRatio.ratio))
            }
            .frame(.same(30))

        }
        .padding()
        .padding(.horizontal)
        .frame(maxWidth: 500)
    }
    
    var imageView: some View {
        let sizeWithAspectRatio = sizeOfRatio
        return VStack {
        }
        .overlay {
            RoundedRectangle(cornerRadius: radius, style: .continuous)
                .stroke(style: .init(
                    lineWidth: 2, lineCap: .round, lineJoin: .round, miterLimit: 0, dash: [], dashPhase: .zero
                ))
                .fill(Color(uiColor: .secondaryLabel))
        }
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.width)
        .overlay(content: {
            Rectangle()
                .fill(.ultraThinMaterial)
                .opacity(4/5)
                .mask(
                    Window(
                        param: SomeVector(value: Params(
                            width: sizeWithAspectRatio.width,
                            height: sizeWithAspectRatio.height,
                            radius: radius
                        ))
                    )
                        .fill(style: FillStyle(eoFill: true))
                )
                .allowsHitTesting(false)
        })
        .clipped()
    }
    
}


struct CropsterView_Previews: PreviewProvider {
    static var previews: some View {
        CropsterView(image: .constant(.init(named: "pic1")!))
            .preferredColorScheme(.dark)
    }
}
