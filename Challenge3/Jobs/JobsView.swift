//
//  JobsView.swift
//  Challenge3
//
//  Created by Sérgio César Lira Júnior on 16/05/24.
//

import Foundation
import SwiftUI



struct JobsView: View {
    //MARK: Variables
    let job: JobsModel
    @Binding var backDegree: Double
    @Binding var frontDegree: Double
    @Binding var isFlipped: Bool

    let width : CGFloat
    let height : CGFloat
    let durationAndDelay : CGFloat = 0.3
    
    func setFlip(){
        isFlipped = false
    }
    

    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    //MARK: View Body
    var body: some View {
        HStack(spacing: 150){
            ZStack {
                CardFront(width: width, height: height, imageJob: job.image, degree: $backDegree)
                CardBack(width: width, height: height, jobDescription: job.description , degree: $frontDegree)
            }.onTapGesture {
                flipCard()
            }
            StoryView(story: job.story, name: job.name, width: width, height: height)
        }

    }
}

struct CardBack : View {
    let width : CGFloat
    let height : CGFloat
    let jobDescription: [String]
    @Binding var degree : Double
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            VStack{
                Text(jobDescription[0])
                Text(jobDescription[1])
            }
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardFront : View {
    let width : CGFloat
    let height : CGFloat
    let imageJob: Image
    @Binding var degree : Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .frame(width: width, height: height)
                .background(.white)
            
            imageJob
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue.opacity(0.7))
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        
    }
}

struct StoryView : View {
    let story: String
    let name: String
    let width : CGFloat
    let height : CGFloat
    var body: some View {
        VStack {
            
            Text(name)
                .padding(.top, 20)
                .font(.custom(
                    "AmericanTypeWriter",
                    size: 40,
                    relativeTo: .largeTitle).bold())
            Text(story)
                .padding(.init(top: 0, leading: 60, bottom: 0, trailing: 60))
                .multilineTextAlignment(.center)
                .font(.custom(
                    "AmericanTypeWriter",
                    size: 28,
                    relativeTo: .largeTitle))
            
        }.frame(width: width, height: height, alignment: .top)
    }
}
