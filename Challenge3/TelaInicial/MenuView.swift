//
//  MenuView.swift
//  Challenge3
//
//  Created by Ana Beatriz Seixas on 28/05/24.
//

import SwiftUI

struct MenuView: View {
    
    var bgAmarelo : Image 
    var w : CGFloat
    var h : CGFloat
    
    @State var viewTutorial : Bool = false
    @State var viewSobre : Bool = false
    @State private var currentIndex = 0
    
     @Binding var isToggled: Bool
    
    var body: some View {
        ZStack{
            bgAmarelo.opacity(0.5)
            
            RoundedRectangle(cornerRadius: 30)
                .fill(.white)
                .strokeBorder(.cardsColorStroke, lineWidth: 10)
                .frame(width: w * 0.73 , height: h * 0.6)
                .overlay{
                    Button(action: {
                        isToggled.toggle()
                    }, label: {
                        Image("sair")
                            .resizable()
                            .frame(width: w * 0.04, height: h * 0.05)
                    }).position(CGPoint(x: w * 0.01, y: h * 0.01))
                }
            
                VStack{
                        Button(action: {
                            viewTutorial.toggle()
                        }, label: {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.cardBackground)
                                .strokeBorder(.cardsColorStroke, lineWidth: 10)
                                .frame(width: w * 0.3 , height: h * 0.1)
                                .overlay{
                                    Text("TUTORIAL")
                                        .font(.custom(GameView.fontBold,size: 35, relativeTo: .body))
                                        .foregroundStyle(.white)
                                }
                        }).padding(20)
                        
                        
                        
                        Button(action: {
                            viewSobre.toggle()
                        }, label: {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.cardBackground)
                                .strokeBorder(.cardsColorStroke, lineWidth: 10)
                                .frame(width: w * 0.3 , height: h * 0.1)
                                .overlay{
                                    Text("SOBRE")
                                        .font(.custom(GameView.fontBold,size: 35, relativeTo: .body))
                                        .foregroundStyle(.white)
                                }
                        }).padding(20)
                    }
            if viewTutorial{
                TutorialView(isCurrentIndex: (currentIndex != 0), bgAmarelo: bgAmarelo, w: w, h: h, showView: true, isToggledTutorial: $viewTutorial)
            }
            
            if viewSobre{
                CreditsView( bgAmarelo: bgAmarelo, w: w, h: h, isToggledSobre: $viewSobre)
            }
        }
    }
}

//#Preview {
//    MenuView()
//}
