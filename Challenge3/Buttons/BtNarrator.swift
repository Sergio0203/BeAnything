//
//  File.swift
//  Challenge3
//
//  Created by Sérgio César Lira Júnior on 27/05/24.
//

import Foundation
import SwiftUI

struct BtNarrator : View{
    var audioJob: String
    @State var isPlaying = false
    var body: some View{
        HStack{
            Button(action: actionNarrator, label: {
                Image(!isPlaying ? .soundon : .soundoff)
            })
            
        }
    }
    
    func actionNarrator(){
        if !isPlaying{
            AudioManager.shared.startAudio(sound: audioJob, type: "mp3")
        }else{
            AudioManager.shared.pauseAudio()
        }
        isPlaying = !isPlaying
    }
}

#Preview {
    BtNarrator(audioJob: "athleteAudio")
}
