//
//  AnimationsTutorial2.swift
//  Challenge3
//
//  Created by Ana Beatriz Seixas on 27/05/24.
//

import Foundation
import SwiftUI

struct AnimationsTutorial2: View {
    
    @State var backDegree: Double = 0.01
    @State var frontDegree: Double = -90
    @State var isFlipped = false
    let durationAndDelay : CGFloat = 0.6
    var isCurrentIndex: Bool = true
    
    @State private var animate : Bool = false
    var w: CGFloat
    var h: CGFloat
    
    func setFlip(){
        isFlipped = false
    }
    
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped && isCurrentIndex{
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else if !isFlipped && isCurrentIndex{
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    
    var body: some View {
        ZStack{
            Image(.backgroundAmarelo)
                .resizable()
                .frame(width: w * 0.35 - 20, height: h * 0.6/2 - 20)
                .cornerRadius(20)
            
            
            HStack(spacing: w * 0.02){
                ZStack {
                    CardFront(width: w * 0.15, height: h * 0.25, imageJob: Image(.tutorial), degree: $backDegree)
                    
                    CardBack(width: w * 0.15, height: h * 0.25, jobDescription: ["Toma suas próprias decisões"], degree: $frontDegree)
                    
                }
                .overlay{
                    Image(.arrasta)
                        .rotationEffect(.radians(150))
                        .position(CGPoint(x: 180.0, y: 240.0))
                        .task{
                            flipCard()
                        }
                }
               
                StoryView(story: "A menina é criativa.\n ", name: "Menina", audio: " ", width: w * 0.15, height: h * 0.25)
                
                
            }.frame(width: w * 0.35 , height: h * 0.6/2)
            
            
        }
    }
}


#Preview {
    AnimationsTutorial2(w: 1366, h: 1024)
}
