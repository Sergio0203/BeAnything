//
//  AnimationsTutorial.swift
//  Challenge3
//
//  Created by Ana Beatriz Seixas on 27/05/24.
//

import Foundation
import SwiftUI

struct AnimationsTutorial: View {
    
    @State private var currentIndex = 0
    @State var dragOffSet: CGFloat = 0
    
    @State private var animate : Bool = false
    var w: CGFloat
    var h: CGFloat
    var img: Image
    
    
    var body: some View {
            VStack{
                
                img
                    .resizable()
                    .frame(width: w * 0.35 - 17, height: h * 0.6/2 - 17)
                    .cornerRadius(20)
                    .overlay{
                        
                        Image(.arrasta)
                            .resizable()
                            .frame(width: w * 0.04, height: h * 0.05)
                            .offset(x: animate ? -(w*0.35/2) + 50 : (w*0.35/2) - 50)
                            .animation(.easeIn(duration: 2).repeatForever(autoreverses: false), value: animate)
                            .task{
                                animate = true
                            }
                    }
            }
    }
}

#Preview {
    AnimationsTutorial(w: 1366, h: 1024, img: Image(.backgroundAmarelo))
}
