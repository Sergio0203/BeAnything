import SwiftUI

struct TelaInicialView: View {
    var body: some View {
        ZStack{
            Button(action: pauseMusic, label: {
               Text("PAUSE")
            })
        }.onAppear{
            playMusic()
        }
        .onDisappear{
            stopMusic()
        }
    }
}

#Preview {
    TelaInicialView()
}
