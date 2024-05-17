//
//  GameView.swift
//  Challenge3
//
//  Created by Sérgio César Lira Júnior on 15/05/24.
//

import SwiftUI

struct GameView: View {
    let jobs = DataBase.listJobs.shuffled()
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var index: Int = 0
    @State var swiped = false
    @State var isFlipped = false
    
    var body: some View {
        
        GeometryReader { screen in
            ZStack {
                VStack {
                    HStack {
                        
                        Spacer()
                        Text("A")
                        Text("B")
                        Text("C")
                        
                    }.frame(alignment: .top)
                        .background(Color.blue)
        
                    Spacer()
                    
                    JobsView(job: jobs[index], backDegree: $backDegree, frontDegree: $frontDegree, isFlipped: $isFlipped, width: screen.size.width/3, height:screen.size.height/1.5).frame(alignment: .center)
                    
                    
                    Spacer()
                }
                .frame(width: screen.size.width, height:screen.size.height, alignment: .top)
            }
            
            .background(Color.white)
            .gesture(DragGesture(minimumDistance: 20, coordinateSpace: .local)
                .onEnded { value in
                    let horizontalAmount = value.translation.width
                    let verticalAmount = value.translation.height
                    
                    if abs(horizontalAmount) > abs(verticalAmount) {
                        if horizontalAmount < 0 && index > 0 {
                            index -= 1
                            
                        }
                        else if horizontalAmount > 0 && index < jobs.count - 1 {
                            index += 1
                        }
                        backDegree = 0.0
                        frontDegree = -90.0
                        isFlipped = false
                    }
                })
        }
        //.ignoresSafeArea()
        
    }
}

#Preview {
    GameView()
}
