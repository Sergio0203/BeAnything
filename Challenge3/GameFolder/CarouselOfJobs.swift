//
//  CarouselOfJobs.swift
//  Challenge3
//
//  Created by Sérgio César Lira Júnior on 21/05/24.
//

import Foundation
import SwiftUI

struct CarouselOfJobs: View {
    @Binding var currentIndex: Int
    @Binding var backDegree: Double
    @Binding var frontDegree: Double
    @Binding var isFlipped: Bool
    @Binding var dragOffSet: CGFloat
    let width: CGFloat
    let height: CGFloat
    let jobs = DataBase.listJobs.shuffled()
    var body: some View {
            VStack{
                ZStack{
                    Image(.backgroundRoxo1).opacity(0)
                    ForEach(0..<jobs.count, id: \.self) { index in
                        JobsView(job: jobs[index], backDegree: $backDegree, frontDegree: $frontDegree, isFlipped: $isFlipped, width: width, height: height).frame(alignment: .center)
                            .opacity(currentIndex == index ? 1.0 : 1)
                            .scaleEffect(currentIndex == index ? 1 : 0.8)
                            .offset(x:CGFloat(index - currentIndex) * ((2 * width) + 150) + dragOffSet, y: 0)

                    }
                }
                
            }
        
    }
}

//#Preview {
//    CarouselOfJobs()
//}
