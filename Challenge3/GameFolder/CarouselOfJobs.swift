//
//  CarouselOfJobs.swift
//  Challenge3
//
//  Created by Sérgio César Lira Júnior on 21/05/24.
//

import Foundation
import SwiftUI

struct CarouselOfJobs: View {
    var currentIndex: Int
    var dragOffSet: CGFloat
    @State var scaleVar = 1
    let width: CGFloat
    let height: CGFloat
    let jobs = DataBase.listJobs
    var body: some View {
            VStack{
                ZStack{
                    ForEach(0..<jobs.count, id: \.self) { index in
                        JobsView(job: jobs[index], isCurrentIndex: currentIndex == index, width: width, height: height)
                            .scaleEffect(currentIndex == index ? 1 : 0.8)
                            .offset(x:CGFloat(index - currentIndex) * ((2 * width) + width/3.5) + dragOffSet, y: 0)
                    }
                }
            }
        
        
    }
}

//#Preview {
//    CarouselOfJobs(currentIndex: 0, dragOffSet: 0.0, width: 100, height: 200)
//}
