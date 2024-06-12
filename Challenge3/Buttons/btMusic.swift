import Foundation
import SwiftUI

struct btMusic : View{
    
    @State var isPlayingMusic = true
    var image : [ImageResource] = [.musicon, .musicoff]
    private let themeSong = "themeSong"
    private let type = "mp3"
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
                AudioManager.shared.startAudio(sound: themeSong, type: type)
            })
    }
    
    func playBtMusic(){
        isPlayingMusic = true
        //AudioManager.shared.setIsButtonActivated(isButtonActivated: true)
    }
    
    func stopBtMusic(){
        isPlayingMusic = false
        //AudioManager.shared.setIsButtonActivated(isButtonActivated: false)
    }
}
