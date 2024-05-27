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
    var body: some View{
        HStack{
            Button(action: actionNarrator, label: {
                Image(.soundon)
            })
            
        }
    }
    func actionNarrator(){
        AudioManager.shared.activateNarrating()
        AudioManager.shared.startAudio(sound: audioJob, type: "mp3")
//        AudioManager.shared.play()
    }
}

#Preview {
    BtNarrator(audioJob: "athleteAudio")
}
