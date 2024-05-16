//
//  GameView.swift
//  Challenge3
//
//  Created by Sérgio César Lira Júnior on 15/05/24.
//

import SwiftUI

struct GameView: View {
    let jobs = DataBase.listJobs    
    
    var body: some View {
        GeometryReader { screen in
            ZStack {
                VStack {
                    HStack {
                        Text("A")
                        Spacer()
                        Text("B")
                        Text("C")
                        
                    }.frame(alignment: .top)
                        .background(Color.blue)
                    
                    Spacer()
                    
                    HStack(spacing: 150) {
                        
                        RoundedRectangle(cornerRadius: 32)
                            .stroke(Color.black, lineWidth: 5)
                            .frame(width: screen.size.width/3, height:screen.size.height/1.5
                            )
                        
                        
                        VStack {
                            
                            Text(jobs[0].name)
                                .padding(.top, 20)
                                .font(.custom(
                                    "AmericanTypeWriter",
                                    size: 40,
                                    relativeTo: .largeTitle).bold())
                            Text(jobs[0].story)
                                .padding(.init(top: 0, leading: 60, bottom: 0, trailing: 60))
                                .multilineTextAlignment(.center)
                                .font(.custom(
                                    "AmericanTypeWriter",
                                    size: 28,
                                    relativeTo: .largeTitle))
                            
                        }.frame(width: screen.size.width/3, height:screen.size.height/1.5, alignment: .top)
                            .border(.black)
                    }.frame(alignment: .center)
                    
                    Spacer()
                }
                .frame(width: screen.size.width, height:screen.size.height, alignment: .top)
                
                
            }.background(Color.white)
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onEnded { value in
                        let horizontalAmount = value.translation.width
                        let verticalAmount = value.translation.height
                        
                        if abs(horizontalAmount) > abs(verticalAmount) {
                            print(horizontalAmount < 0 ? "left swipe" : "right swipe")
                        } else {
                            print(verticalAmount < 0 ? "up swipe" : "down swipe")
                        }
                    })
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    GameView()
}
