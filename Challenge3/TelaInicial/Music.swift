import Foundation
import SwiftUI
import AVFoundation

var audioPlayer : AVAudioPlayer?

struct Music : View {
    
    var image = Image(.btTocando)
    
    var body: some View {
        VStack{
            Button(action: pauseMusic, label: {
                Image(.btPausado)
            })
        }
    }
}

func playMusic() {
    let resourcePath = Bundle.main.url(forResource: "musicas", withExtension: "mp3")
    
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: resourcePath!)
        audioPlayer?.play()
        
    } catch {
        print(error.localizedDescription)
    }
}

func pauseMusic(){
    if let player = audioPlayer {
        player.pause()
    }
}

func stopMusic() {
    if let player = audioPlayer {
        player.stop()
    }
}
