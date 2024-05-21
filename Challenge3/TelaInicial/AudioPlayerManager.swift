import Foundation
import AVFoundation

var audioPlayer : AVAudioPlayer?

func playSound(sound: String, type: String) {
    let resourcePath = Bundle.main.url(forResource: sound, withExtension: type)
    
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: resourcePath!)
        audioPlayer?.play()
        
    } catch {
        print(error.localizedDescription)
    }
}

func stopSound() {
    if let player = audioPlayer {
        player.stop()
    }
}
