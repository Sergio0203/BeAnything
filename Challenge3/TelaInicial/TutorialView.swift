/// TUTORIAAAAALLLLLL
/// //
//  TutorialView.swift
//  Challenge3
//
//  Created by Ana Beatriz Seixas on 26/05/24.


import SwiftUI

struct TutorialView: View {

    var isCurrentIndex: Bool
    @State var backDegree: Double = 0.01

    var bgAmarelo : Image
    var w: CGFloat
    var h: CGFloat
    var title = "Tutorial"
    var text = "Nessa brincadeira você pode ser o que vc quiser, desde uma astronauta que explora o espaço até uma guerreira que defende seu povo. É disso que vamos brincar, nessas aventuras você vai ter que resolver um problema com muita imaginação brincando de faz de conta! Você está pronta para a aventura?"

    var text2 = "• Clique na carta da personagem para encontrar dicas sobre o que ela faz.\n\n • Arraste para o lado para encontrar novas profissões e histórias."

    @State var currentPage = 0
    @State var showView: Bool
    
    @Binding var isToggledTutorial: Bool



    var body: some View {

        ZStack{
            bgAmarelo.opacity(0.5)
            
            RoundedRectangle(cornerRadius: 30)
                .fill(.cardsColorStroke)
                .strokeBorder(.cardsColorStroke, lineWidth: 10)
                .frame(width: w * 0.9 , height: h * 0.75)
                .overlay{
                    Button(action: {
                        isToggledTutorial.toggle()
                    }, label: {
                        Image("sair")
                            .resizable()
                            .frame(width: w * 0.04, height: h * 0.05)
                    })
                        .border(.red)
                }
            
            TabView(selection: $currentPage){

                VStack{
                    Text(title)
                        .foregroundStyle(.black)
                        .font(.custom(GameView.fontBold,size: 40))

                    HStack(spacing: 100){
                        CardFront(width: w * 0.35, height: h * 0.6, imageJob: Image(.tutorial), degree: $backDegree)
                            

                        StoryView(story: text, name: "VAMOS BRINCAR?", audio: "tutorialAudio", width: w*0.35, height: h * 0.6)
                    }.frame(width: w * 0.78, height: h * 0.6)
                }.tag(0)



                VStack{
                    Text(title)
                        .foregroundStyle(.black)
                        .font(.custom(GameView.fontBold,size: 40))

                    HStack(spacing: 100){

                        RoundedRectangle(cornerRadius: 30)
                            .fill(.clear)
                            .frame(width: w * 0.35 , height: h * 0.6)
                            .overlay{
                                VStack{
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(.cardBackground)
                                        .strokeBorder(.cardsColorStroke, lineWidth: 10)
                                        .frame(width: w * 0.35 , height: h * 0.6/2)
                                        .overlay{
                                            AnimationsTutorial2(w: w, h: h)
                                        }
                                    

                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(.cardBackground)
                                        .strokeBorder(.cardsColorStroke, lineWidth: 10)
                                        .frame(width: w * 0.35 , height: h * 0.6/2)
                                        .overlay{
                                            AnimationsTutorial(w: w, h: h, img: Image(.tutorialTela))
                                        }
                                }
                            }
                        


                        StoryView(story: text2, name: "COMO JOGAR?", audio: " ", width: w*0.35, height: h * 0.6)
                    }.frame(width: w * 0.78, height: h * 0.6)
                }.tag(1)


            }.tabViewStyle(.page)
                .frame(width: w * 0.9, height: h * 0.75)///


        }.ignoresSafeArea()
    }
}
