import Foundation
import SwiftUI

//vou modificar quanto tivermos todos os efeitos sonoros
//acredito que vou ter que armazenar eles em um array - para poder desativar todos ao mesmo tempo

struct btSound : View{
    @State var isPlayingSounds = true
    var image : [ImageResource] = [.iconSound, .iconSoundOff]
    
    var body: some View{
        HStack{
            if isPlayingSounds{
                Button(action: stopbtSounds, label: {
                    Image(image[0])
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(2.5)
                })
            } else{
                Button(action: playbtSounds, label:{
                    Image(image[1])
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(2.5)
                })
            }
        }.padding(5)
    }
    func playbtSounds(){
        playSound(sound: "musicas", type: "mp3")
        isPlayingSounds = true
    }

    func stopbtSounds(){
        stopSound()
        isPlayingSounds = false
    }

}

