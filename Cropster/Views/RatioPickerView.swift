//
//  RatioPicker.swift
//  Cropster
//
//  Created by Varun on 05/08/23.
//

import SwiftUI

struct RatioPickerView: View {
    
    let allRatios = FrameRatios.allCases

    var aspect: CGFloat
    @Binding var selected: Ratios
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 24) {
                
                RatioBlock(ratio: .original(aspect))
                
                ForEach(allRatios, id: \.self) { ratio in
                    RatioBlock(ratio: .constants(ratio))
                }
                
            }.padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: 90)
    }
    
    @ViewBuilder
    func RatioBlock(ratio: Ratios) -> some View {
        let size: CGSize = .init(width: 72, height: 72).sizeWith(ratio: ratio.ratio)
        
        Button {
            withAnimation() {
                selected = ratio
            }
        } label: {
            VStack {
                Spacer(minLength: 0)
                Rectangle()
                    .stroke()
                    .frame(width: size.width, height: size.height)
                    .padding(.all, 4)
                
                Spacer(minLength: 0)
                
                Text(ratio.label)
                    .font(.monospaced(.caption2)())
            }
        }
        .tint(ratio == selected ? .primary : .secondary)
        .padding(.vertical, 2).padding(.bottom, 2)
    }
    
}

struct RatioPicker_Previews: PreviewProvider {
    static var previews: some View {
        @State var testSelectedRatio: Ratios = .constants(._2x3)
        RatioPickerView(aspect: 2.0, selected: $testSelectedRatio)
            .preferredColorScheme(.dark)
    }
}
