//
//  ViewController.swift
//  FlowList
//
//  Created by Daniel on 12/20/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit
import Alamofire

class FLMasterController: UIViewController {
    
    var audioPlayerManager:FLAudioPlayerManager!
    @IBOutlet weak var playBackView: FLPlaybackView!
    
//    var audioURLString:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        audioPlayerManager = FLAudioPlayerManager(playBackView: playBackView, audioFile: "GoDJ", fileExtension: "mp3")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func post(sender: AnyObject) {
        
        let parameters = [ "search" : ["query" : "Nina Kraviz"],
            ] as Dictionary
        
        
        Alamofire.request(.POST, "http://flowlist.io/search", parameters: parameters)
            .responseJSON { (request, response, json, error) in
                
                if(error != nil) {
                    println(error?.description)
                }
                else {
                    var audioURLString:String?
                    let jsonDict = JSON(json!)
                    for (key: String, subJson: JSON) in jsonDict {
                        if key == "tracks" {
                            let firstResultJSON = subJson[0]
                            audioURLString = firstResultJSON["stream_url"].string
                            println(audioURLString)
                        }
                    }
                    
                   self.audioPlayerManager = FLAudioPlayerManager(playBackView: self.playBackView, audioURL: audioURLString!)
                }
                
        }
        
    }

}

