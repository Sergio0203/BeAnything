import Foundation
import AVFoundation

class AudioController{
    var audioPlayer : AVAudioPlayer?
    static var shared = AudioController()
    private init(){
    }
    func playSound(sound: String, type: String) {
        DispatchQueue.main.async{
            do {
                guard let resourcePath = Bundle.main.url(forResource: sound, withExtension: type)
                else { return }
                self.audioPlayer = try AVAudioPlayer(contentsOf: resourcePath)
                self.audioPlayer?.play()
            }catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func stopSound() {
        if let player = audioPlayer {
            player.stop()
        }
    }
}

final class AudioManager {
    static let shared = AudioManager()
    
    private var player: AVPlayer?
    
    private var session = AVAudioSession.sharedInstance()
    
    private init() {}
    
    private func activateSession() {
        do {
            try session.setCategory(
                .playback,
                mode: .default,
                options: []
            )
        } catch _ {}
        
        do {
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch _ {}
        
        do {
            try session.overrideOutputAudioPort(.speaker)
        } catch _ {}
    }
    
    func startAudio(sound: String, type: String) {
        
        activateSession()
        
        guard let url = Bundle.main.url(forResource: sound, withExtension: type)
        else{ return }
        
        let playerItem: AVPlayerItem = AVPlayerItem(url: url)
        if let player = player {
            player.replaceCurrentItem(with: playerItem)
        } else {
            player = AVPlayer(playerItem: playerItem)
        }
        
        if let player = player {
            player.play()
        }
    }
    
    func play() {
        if let player = player {
            player.play()
        }
    }
    
    func pause() {
        if let player = player {
            player.pause()
        }
    }
}
