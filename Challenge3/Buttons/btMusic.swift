import Foundation
import SwiftUI

struct btMusic : View{
    
    @State var isPlayingMusic = true
    //state - ao mexer na variavel vai ser executado novamente
    
    var image : [ImageResource] = [.iconMusic, .iconMusicOff]
    
    
    var body: some View{
        HStack{
            Button(action: isPlayingMusic ? stopBtMusic : playBtMusic, label: {
                Image(isPlayingMusic ? image[0] : image[1])
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(2.5)
            })
        }.padding(5)
            .onAppear(perform: {
                AudioManager.shared.startAudio(sound: "musica", type: "mp3")
            })
    }
    
    func playBtMusic(){
        isPlayingMusic = true
        AudioManager.shared.play()
    }
    
    func stopBtMusic(){
        isPlayingMusic = false
        AudioManager.shared.pause()
    }
}