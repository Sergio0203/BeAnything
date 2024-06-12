import Foundation
import SwiftUI
import AVFoundation

protocol Playable {
    var player: AVPlayer? {get set}
    func pausePlayer()
    func playPlayer()
}

struct PlayerSoundFX: Playable {
    var player: AVPlayer?
    
    func pausePlayer() {
        player?.pause()
    }
    
    func playPlayer() {
        player?.play()
    }
}

struct PlayerBackground: Playable {
    var player: AVPlayer?
    
    func pausePlayer() {
        player?.pause()
    }
    
    func playPlayer() {
        player?.play()
        
    }
}

final class AudioManager {
    static let shared = AudioManager()
    private var audio: Playable = PlayerBackground()
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
        if let player = audio.player {
            player.replaceCurrentItem(with: playerItem)
        } else {
            audio.player = AVPlayer(playerItem: playerItem)
        }
        
        //        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlayingNarrating(_:)), name: .AVPlayerItemDidPlayToEndTime, object: playerItem)
        
        if let player = audio.player {
            audio.playPlayer()
        }
    }
    func pauseAudio(){
        audio.pausePlayer()
    }
    func playAudio(){
        audio.playPlayer()
    }
}






