import Foundation
import SwiftUI
#warning("Poderia usar o marcado //TODO:")
//MARK: vou modificar quanto tivermos todos os efeitos sonoros
//acredito que vou ter que armazenar eles em um array - para poder desativar todos ao mesmo tempo
#warning("Remover arquivos que não serão usados!")
struct btSound : View{
    @State var isPlayingSounds = true
    var image : [ImageResource] = [.iconSound, .iconSoundOff]
    
    var body: some View{
        HStack{
            #warning("Poderia o usar o toggle!")
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
//        AudioController.shared.playSound(sound: "musicas", type: "mp3")
        isPlayingSounds = true
    }
    
    func stopbtSounds(){
//        /*AudiostopSound*/()
        isPlayingSounds = false
    }
    
}

