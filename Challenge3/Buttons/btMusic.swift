import Foundation
import SwiftUI
#warning("Tipos devem seguir a convenção PascalCase")
struct btMusic : View{
    
    @State var isPlayingMusic = true
    var image : [ImageResource] = [.musicon, .musicoff]
    
    
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
                AudioManager.shared.startAudio(sound: "themeSong", type: "mp3")
            })
    }
    
    func playBtMusic(){
        isPlayingMusic = true
        AudioManager.shared.setIsButtonActivated(isButtonActivated: true)
        if !AudioManager.shared.getIsNarrating(){
            AudioManager.shared.startAudio(sound: "themeSong", type: "mp3")
        }
    }
    
    func stopBtMusic(){
        isPlayingMusic = false
        AudioManager.shared.setIsButtonActivated(isButtonActivated: false)
        if !AudioManager.shared.getIsNarrating(){
            AudioManager.shared.pause()
        }
    }
}
