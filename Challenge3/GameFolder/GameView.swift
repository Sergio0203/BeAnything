//
//  GameView.swift
//  Challenge3
//
//  Created by Sérgio César Lira Júnior on 15/05/24.
//

import SwiftUI


struct GameView: View {
//    static let fontRegular: String = "SF Pro Rounded Regular"
//    static let fontBold: String = "SF Pro Rounded Bold"
    static let fontBold: String = "SF Pro Rounded Black"
    static let fontRegular: String = "SF Pro Rounded Medium"
    let jobs = DataBase.listJobs.shuffled()
    @State private var currentIndex = 0
    @State var dragOffSet: CGFloat = 0
    @State private var dragAmount = CGSize.zero
    @State var viewOpacity: Double = 1
    @State var distanceFromMid: CGSize = CGSize(width: 0, height: 0)
    var body: some View {
        
        GeometryReader { screen in
            ZStack {
                Image(.backgroundAmarelo).resizable()
                VStack{
                    HStack (spacing: 50) {
                        
                        Spacer()
                        btMusic()
                        btSound()
                        btCredits()
                        
                    }.padding()
                    
                    Spacer()
                    
                    CarouselOfJobs(currentIndex: currentIndex, dragOffSet: dragOffSet, width: screen.size.width * 0.35, height:screen.size.height * 0.6).frame(alignment: .center)
                    Spacer()
                }
                .frame(width: screen.size.width, height:screen.size.height, alignment: .top)
            }
            .gesture(
                DragGesture()
                    .onEnded({ value in
                        let threshold: CGFloat = 50
                        
                        if value.translation.width > threshold {
                            
                            withAnimation {
                                currentIndex = max(0, currentIndex - 1)
                            }
                            
                        }else if value.translation.width < -threshold {
                            withAnimation {
                                currentIndex = min(jobs.count - 1, currentIndex + 1)
                            }
                        }
                        dragOffSet = 0
                    })
            )
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    GameView()
}
