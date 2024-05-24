import SwiftUI

struct TelaInicialView: View {
    var body: some View {
        ZStack{
            Image(.backgroundRoxo1)
                .resizable()
            VStack{
                
                HStack{
                    Spacer()
                    btMusic()
                    btSound()
                    btCredits()
                }
                
                Spacer()
            }
        }.onAppear{
            //playSound(sound: "musicas", type: "mp3")
        }
//        .onDisappear{
//            stopSound()
//        }
        .ignoresSafeArea()
    }
}

#Preview {
    TelaInicialView()
}
