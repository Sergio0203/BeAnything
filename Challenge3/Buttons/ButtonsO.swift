import Foundation
import SwiftUI

struct ButtonsO{
        
        var image : [ImageResource]
        var isPlaying : Bool
        
        init(image: [ImageResource], isPlaying: Bool) {
            self.image = image
            self.isPlaying = isPlaying
        }
    }
