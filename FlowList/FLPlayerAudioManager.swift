//
//  FLPlayerAudioController.swift
//  FlowList
//
//  Created by Daniel on 1/11/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import Foundation
import AVFoundation

class FLPlayerAudioManager: NSObject {
    
    class var shared : FLPlayerAudioManager {
        struct Static {
            static let instance : FLPlayerAudioManager = FLPlayerAudioManager()
        }
        return Static.instance
    }
    
    private var audioPlayer:AVPlayer?
    
    
    func playItemForURL(URL:NSURL) {
        audioPlayer = AVPlayer(URL: URL)
        audioPlayer?.play()
    }
    
    
}

