import Foundation
import AVFoundation
final class AudioManager {
    static let shared = AudioManager()
    
    private var player: AVPlayer?
    private var session = AVAudioSession.sharedInstance()
    
    private var isButtonActivated = true
    private var isNarrating = false
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
    
    func setIsButtonActivated(isButtonActivated: Bool){
        self.isButtonActivated = isButtonActivated
    }
    func getIsNarrating() -> Bool{
        return isNarrating
    }
    func activateNarrating(){
        isNarrating = true
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying(_:)), name: .AVPlayerItemDidPlayToEndTime, object: playerItem)

        if let player = player {
            player.play()
        }
    }
    
    @objc private func playerDidFinishPlaying(_ notification: Notification) {
            if let player = player {
                if isButtonActivated{
                    startAudio(sound: "themeSong", type: "mp3")
                }
                isNarrating = false
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
