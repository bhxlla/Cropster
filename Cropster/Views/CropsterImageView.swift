//
//  CropsterImageView.swift
//  Cropster
//
//  Created by Varun on 05/08/23.
//

import SwiftUI

struct CropsterImageView: View {
        
    @Binding var image: UIImage
    @Binding var size: CGSize
    @Binding var offset: CGSize
    @Binding var scale: CGFloat
    
    var body: some View {
        
        VStack {
        }
        .frame(size)
        .background(.gray)
    }
    

}



struct CropsterImageView_Previews: PreviewProvider {
    static var previews: some View {
        CropsterImageView(
            image: .constant(.init(named: "pic1")!),
            size: .constant(.same(300.0)),
            offset: .constant(.same(0.5)),
            scale: .constant(1)
        )
    }
}
