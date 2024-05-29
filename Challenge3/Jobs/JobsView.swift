//
//  JobsView.swift
//  Challenge3
//
//  Created by Sérgio César Lira Júnior on 16/05/24.
//

import Foundation
import SwiftUI

struct JobsView: View {
    let job: JobsModel
    @State var backDegree: Double = 0.01
    @State var frontDegree: Double = -90
    @State var isFlipped = false
    @State var scaleVar: CGFloat = 1
    var isCurrentIndex: Bool
    let width : CGFloat
    let height : CGFloat
    let durationAndDelay : CGFloat = 0.3
    
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
        HStack(spacing: 150){
            ZStack {
                CardFront(width: width, height: height, imageJob: job.image, degree: $backDegree)
                CardBack(width: width, height: height, jobDescription: job.description, degree: $frontDegree)
            }
            .onTapGesture {
                flipCard()
            }
            StoryView(story: job.story, name: job.name, audio: job.audioName, width: width, height: height)
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
                .fill(.cardBackground)
                .strokeBorder(.cardsColorStroke, lineWidth: 10)
                .frame(width: width, height: height)
            VStack(){
                Text("O que ela faz?")
                    .font(.custom(GameView.fontBold, size: 40, relativeTo: .largeTitle))
                    .foregroundStyle(.white)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                    
                
                ForEach(0..<jobDescription.count, id: \.self) { index in
                        Text("• "+jobDescription[index] + ";")
                            .multilineTextAlignment(.leading)
                            .font(.custom(
                                GameView.fontRegular,
                                size: 30,
                                relativeTo: .caption))
                            .lineLimit(nil)
                            .frame(width: width*0.8, alignment: .leading)
                            .frame(minHeight: height*0.13)
                            .foregroundStyle(Color.white)
                            .padding(.bottom, 17)
                            .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
            }.frame(width: width, height: height, alignment: .center)
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
            RoundedRectangle(cornerRadius: 30)
                .fill(.white)
                .strokeBorder(.cardsColorStroke, lineWidth: 10)
                .frame(width: width, height: height)
            
            imageJob
                .resizable()
                .foregroundColor(.blue.opacity(0.7))
                .frame(width: width * 0.79, height: height * 0.78)
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        
    }
}

struct StoryView : View {
    let story: String
    let name: String
    let audio: String
    let width : CGFloat
    let height : CGFloat
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .fill(.cardBackground)
                .strokeBorder(.cardsColorStroke, lineWidth: 10)
                .frame(width: width, height: height)
            VStack {
                Text(name)
                    .foregroundStyle(.white)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                    .font(.custom(
                        GameView.fontBold,
                        size: 40, relativeTo: .largeTitle))
                ScrollView([.vertical], showsIndicators: false){
                    Text(story)
                        .foregroundStyle(.white)
                        .frame(width: width*0.8, alignment: .leading)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .font(.custom(
                            GameView.fontRegular,
                            size: 30, relativeTo: .body))
                        .fixedSize(horizontal: false, vertical: false)
                }.frame(width: width, height: height*0.7)
                HStack{
                    Spacer()
                    BtNarrator(audioJob: audio).padding(.trailing, 20)
                        .padding(.top, 10)
                        
                }
            }.frame(width: width, height: height, alignment: .top)
        }
    }
}

