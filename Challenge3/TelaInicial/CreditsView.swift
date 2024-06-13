import Foundation
import SwiftUI

struct CreditsView: View {

    var bgAmarelo : Image
    var w: CGFloat
    var h: CGFloat
    #warning("Poderiam ter colocado esses dados num model!")
    var title = "O que é o  Dream Gap?"
    var text = "O Dream Gap ou Lacuna dos Sonhos começa por volta dos 6 anos quando as meninas começam a desenvolver crenças autolimitantes e pensam que não são tão inteligentes e capazes quanto os meninos. Elas param de acreditar que seu devido a seu gênero podem ser qualquer profissão que quiserem. Desejamos inspirar o potencial ilimitado das meninas, através da encenação, para que elas possam se inspirar e se imaginar em diferentes profissões e papéis. Devemos fornecer às meninas representatividade e estímulo ao seu potencial criativo para diminuir a Lacuna dos Sonhos."
    
    @Binding var isToggledSobre: Bool

    var body: some View {

            ZStack{
                bgAmarelo.opacity(0.5)

                RoundedRectangle(cornerRadius: 50)
                    .fill(.cardBackground)
                    .strokeBorder(.cardsColorStroke, lineWidth: 18)
                    .frame(width: w * 0.73, height: h * 0.6)
                    .overlay{
                        Button(action: {
                            isToggledSobre.toggle()
                        }, label: {
                            Image(.sair)
                                .resizable()
                                .frame(width: w * 0.04, height: h * 0.05)
                        }).position(CGPoint(x: w * 0.02, y: h * 0.02))
                        #warning("Magic MUITO numbers!")
                    }


                VStack {
                    Text(title)
                        .foregroundStyle(.white)
                        .padding(.top, 40)
                        .padding(.bottom, 40)
                        .multilineTextAlignment(.leading)
                        .font(.custom(GameView.fontBold,size: 40, relativeTo: .largeTitle))

                    ScrollView([.vertical], showsIndicators: false){
                        Text(text)
                            .foregroundStyle(.white)
                            .frame(width: w * 0.63, alignment: .leading)
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .font(.custom(GameView.fontRegular,size: 30, relativeTo: .body))
                            .fixedSize(horizontal: false, vertical: true)

                    }
                    .padding(.bottom, 30)

                }.frame(width: w * 0.73, height: h * 0.6, alignment: .top)

            }.ignoresSafeArea()
        }
    }

//#Preview {
//    CreditsView(bgAmarelo: Image(.backgroundAmarelo), w: 1366, h:1024)
//}
