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
    @State private var dragAmount = CGSize.zero
    @State var viewOpacity: Double = 1

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
                        .offset(CGSize(width: dragAmount.width, height: 0))
                        .opacity(viewOpacity)
                        
                        


                    
                    
                    Spacer()
                }
                .frame(width: screen.size.width, height:screen.size.height, alignment: .top)
            }
            .background(Color.white)
            .gesture(DragGesture(minimumDistance: 20, coordinateSpace: .local)
                .onChanged({
                    dragAmount = $0.translation
                    viewOpacity = 1 - Double(abs(dragAmount.width)/1000)
                })
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
                        withAnimation(.linear(duration: 0.7)){
                            dragAmount = .zero
                            viewOpacity = 1
                        }
                    }
                })
        }
        //.ignoresSafeArea()
        
    }
}

#Preview {
    GameView()
}
