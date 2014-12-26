//
//  ViewController.swift
//  FlowList
//
//  Created by Daniel on 12/20/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLMasterController: UIViewController {
    
    var audioPlayerManager:FLAudioPlayerManager!
    @IBOutlet weak var playBackView: FLPlaybackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        audioPlayerManager = FLAudioPlayerManager(playBackView: playBackView, audioFile: "GoDJ", fileExtension: "mp3")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

