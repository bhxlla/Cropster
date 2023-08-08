//
//  IntroView.swift
//  Cropster
//
//  Created by Varun on 05/08/23.
//

import SwiftUI

struct IntroView: View {
    
    let imageChosen: (UIImage) -> ()
    
    let iList1 = ["pic1", "pic3", "pic5", "pic7"].map(UIImage.init(named:))
    
    let iList2 = ["pic2", "pic4", "pic6", "pic8"].map(UIImage.init(named:))
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                Text("Choose an Image")
                    .font(.monospaced(.title)())
                    .frame(alignment: .leading)
                
                HStack(alignment: .top) {
                    
                    VStack {
                        
                        ForEach(0..<iList1.count) { i in
                            ImageSelector(image: iList1[i]!)
                        }
                    }
                    
                    VStack {
                        ForEach(0..<iList2.count) { i in
                            ImageSelector(image: iList2[i]!)
                        }
                    }
                    
                }
            }
        }
        .padding(.top).padding(.top)
    }
    
    @ViewBuilder
    func ImageSelector(image: UIImage) -> some View {
        Button {
            imageChosen(image)
        } label: {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }

    }
    
}
struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(imageChosen: {_ in })
    }
}
