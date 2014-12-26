//
//  FLAudioPlayerManager.swift
//  FlowList
//
//  Created by Daniel on 12/20/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation
import AVFoundation

class FLAudioPlayerManager: NSObject {
    
    var audioPlayer:AVPlayer!
    var playBackView:FLPlaybackView
    
//    init(playBackView:FLPlaybackView, audioFile:String, fileExtension:String) {
//        
//        self.playBackView = playBackView
//        super.init()
//        let audioFileURL = NSBundle.mainBundle().URLForResource(audioFile, withExtension: fileExtension)
//        var error:NSError?
//        audioPlayer = AVAudioPlayer(contentsOfURL: audioFileURL!, error: &error)
//        playBackView.delegate = self
//        playBackView.trackScrubber.maximumValue = Float(getAudioDuration())
//        playBackView.trackTimeElapsedLabel.text = "0:00"
//        playBackView.tracktimeDurationLabel.text = "\(timeFormat(getAudioDuration()))"
//    }
    
    
    init(playBackView:FLPlaybackView, audioURL:String) {
        
        self.playBackView = playBackView
        super.init()
        let audioFileURL = NSURL(string: audioURL)
        var error:NSError?
        audioPlayer = AVPlayer(URL: audioFileURL)
        playBackView.delegate = self
//        playBackView.trackScrubber.maximumValue = Float(getAudioDuration())
//        playBackView.trackTimeElapsedLabel.text = "0:00"
//        playBackView.tracktimeDurationLabel.text = "\(timeFormat(getAudioDuration()))"
    }

    
    
    
    
    func playAudio() {
        audioPlayer.play()
    }
    
    func pauseAudio() {
        audioPlayer.pause()
    }
    
//    func setCurrentAudioTime(value:Double) {
//        audioPlayer.currentTime = value
//    }
//    
//    func getAudioDuration() -> Double {
//        return audioPlayer.duration
//    }
//    
//    func timeFormat(value:Double) -> String {
//        let minutes = floor(Double(lround(value))/Double(60.0))
//        let seconds = Double(lround(value)) - Double(minutes * 60)
//        let roundedSeconds = lround(seconds)
//        let roundedMinutes = lround(minutes)
//        
//        let time = "\(roundedMinutes)\(roundedSeconds)"
//        
//        return time
//    }
//    
//    func getCurrentAudioTime() -> NSTimeInterval {
//        return audioPlayer.currentTime
//    }
    
}

extension FLAudioPlayerManager:FLPlaybackViewDelegate {
    
    func playTapped() {
        playAudio()
    }
    
    func pauseTapped() {
        pauseAudio()
    }
}
