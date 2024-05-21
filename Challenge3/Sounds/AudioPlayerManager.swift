import Foundation
import SwiftUI
import AVFoundation

var audioPlayer : AVAudioPlayer?

func playSound(sound : String, type: String) {
    let resourcePath = Bundle.main.url(forResource: sound, withExtension: type)
    
    
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: resourcePath!)
        audioPlayer?.play()
        
    } catch {
        print(error.localizedDescription)
    }
}

func pauseSound(){
    if let player = audioPlayer {
        player.pause()
    }
}

func stopSound() {
    if let player = audioPlayer {
        player.stop()
    }
}
