//
//  ContentView.swift
//  Cropster
//
//  Created by Varun on 05/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var image: UIImage? = nil
    @State var showDetail: Bool = false
    
    @State var initShow = false
    
    var body: some View {
        NavigationView {
            
            ZStack {
                if initShow {
                    IntroView.init { img in
                        image = img
                        showDetail = true
                    }
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
                }
            }
            .background {
                NavigationLink(
                    destination: CropsterScreen(image: $image),
                    isActive: $showDetail
                ) {
                    EmptyView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: .init(block: {
                    withAnimation {
                        initShow = true
                    }
                }))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
