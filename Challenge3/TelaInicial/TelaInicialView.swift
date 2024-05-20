import SwiftUI

struct TelaInicialView: View {
    var body: some View {
        ZStack{
            Image(.backgroundRoxo1)
                .resizable()
            
            VStack{
                Button(action: pauseMusic, label: {
                    Text("PAUSE")
                })
            }
        }.onAppear{
            //playMusic()
        }
        .onDisappear{
            stopMusic()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TelaInicialView()
}
