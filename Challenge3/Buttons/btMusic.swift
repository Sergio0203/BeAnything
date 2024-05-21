import Foundation
import SwiftUI

struct btMusic : View{
    
    @State var isPlayingMusic = true
    //state - ao mexer na variavel vai ser executado novamente
    
    var image : [ImageResource] = [.iconMusic, .iconMusicOff]
    
    
    var body: some View{
        HStack{
            if isPlayingMusic{
                Button(action: stopBtMusic, label: {
                    Image(image[0])
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(2.5)
                })
            } else{
                Button(action: playBtMusic, label:{
                    Image(image[1])
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(2.5)
                })
            }
        }.padding(5)
    }
    func playBtMusic(){
        playSound(sound: "musicas", type: "mp3")
        isPlayingMusic = true
    }

    func stopBtMusic(){
        stopSound()
        isPlayingMusic = false
    }
}
