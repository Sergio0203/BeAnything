//
//  GameView.swift
//  Challenge3
//
//  Created by Sérgio César Lira Júnior on 15/05/24.
//

import SwiftUI

struct GameView: View {
    let jobs = DataBase.listJobs.shuffled()
    @State private var currentIndex = 0
    @State var dragOffSet: CGFloat = 0
    @State var backDegree: Double = 0
    @State var frontDegree: Double = -90
    @State var isFlipped = false
    @State private var dragAmount = CGSize.zero
    @State var viewOpacity: Double = 1
    @State var distanceFromMid: CGSize = CGSize(width: 0, height: 0)
    var body: some View {
        
        GeometryReader { screen in
            ZStack {
                Image(.backgroundAmarelo)
                VStack {
                    HStack {
                        
                        Spacer()
                        Text("A")
                        Text("B")
                        Text("C")
                        
                    }.frame(alignment: .top)
                      //  .background(Color.blue)
        
                    Spacer()
//                    JobsView(job: jobs[index], backDegree: $backDegree, frontDegree: $frontDegree, isFlipped: $isFlipped, width: screen.size.width*0.35, height:screen.size.height*0.6).frame(alignment: .center)
//                        .offset(CGSize(width: dragAmount.width, height: 0))
//                        .opacity(viewOpacity)
//                        .onAppear(perform: {
//                            print(jobs)
//                        })
                    CarouselOfJobs(currentIndex: $currentIndex, backDegree: $backDegree, frontDegree: $frontDegree, isFlipped: $isFlipped, dragOffSet: $dragOffSet, width: screen.size.width * 0.35, height:screen.size.height * 0.6).frame(alignment: .center)
                    Spacer()
                }
                .frame(width: screen.size.width, height:screen.size.height, alignment: .top)
            }
            .gesture(
                DragGesture()
//                    .onChanged({value in
//                        let threshold = screen.size.width*0.35/3
//                        dragOffSet = value.translation.width
//
//                        if dragOffSet > threshold{
//                            dragOffSet = threshold
//                        } else if dragOffSet < -threshold{
//                            dragOffSet = -threshold
//                        }
//                    })
                .onEnded({value in
                    let threshold: CGFloat = 50

                    if value.translation.width > threshold {
                        backDegree = 0.0
                        frontDegree = -90.0
                        isFlipped = false
                        withAnimation {
                            currentIndex = max(0, currentIndex - 1)
                        }
                        
                    }else if value.translation.width < -threshold {
                        backDegree = 0.0
                        frontDegree = -90.0
                        isFlipped = false
                        withAnimation {
                            currentIndex = min(jobs.count - 1, currentIndex + 1)
                        }
                    }
                    dragOffSet = 0

                    
                })
            )
//            .gesture(DragGesture(minimumDistance: 20, coordinateSpace: .local)
//                .onChanged({
//                    dragAmount = $0.translation
//                    viewOpacity = 1 - Double(abs(dragAmount.width)/1000)
//                })
//                .onEnded { value in
//                    let horizontalAmount = value.translation.width
//                    let verticalAmount = value.translation.height
//                    
//                    if abs(horizontalAmount) > abs(verticalAmount) {
//                        if horizontalAmount < 0 && index > 0 {
//                            index -= 1
//                        }
//                        else if horizontalAmount > 0 && index < jobs.count - 1 {
//                            index += 1
//                        }
//                        backDegree = 0.0
//                        frontDegree = -90.0
//                        isFlipped = false
//                        withAnimation(.linear(duration: 0.7)){
//                            dragAmount = .zero
//                            viewOpacity = 1
//                        }
//                    }
//                })
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    GameView()
}
