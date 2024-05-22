import Foundation
import SwiftUI

//vou modificar quanto tivermos todos os efeitos sonoros
//acredito que vou ter que armazenar eles em um array - para poder desativar todos ao mesmo tempo

struct btSound : View{
    @State var isPlayingSounds = true
    var image : [ImageResource] = [.iconSound, .iconSoundOff]
    
    var body: some View{
        HStack{
            Button(action: isPlayingSounds ? stopbtSounds : playbtSounds, label: {
                Image(isPlayingSounds ? image[0] : image[1])
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(2.5)
            })
        }
        .padding(5)
        
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

