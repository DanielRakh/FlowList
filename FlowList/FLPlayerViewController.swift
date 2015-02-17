//
//  FLPlayerViewController.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLPlayerViewController: UIViewController {

    var eventHandler:FLPlayerPresenter?

    @IBOutlet weak var backgroundBlurView: UIVisualEffectView!
    @IBOutlet weak var vibrancyBackground: UIVisualEffectView!
    
    @IBOutlet weak var creatorTitleLabel: UILabel!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    
    @IBOutlet var playerButtonsCollection: [UIButton]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    func setupUI() {
        
        vibrancyBackground.contentView.backgroundColor = UIColor.FLCHazyBlue()
        
        
        setupPlayerButtons()
    
    }
    
    
    func setupPlayerButtons() {
        
        var actionName:String!
        
        for button in playerButtonsCollection {
            
            switch button.tag {
            case 1:
                actionName = "Previous"
            case 2:
                actionName = "Repeat"
            case 3:
                actionName = "Next"
            default:
                println("There was an error")
            }
            
            button.setAttributedTitle(NSAttributedString(string: actionName, attributes: [NSForegroundColorAttributeName: UIColor.FLCPlainWhite(),
                NSFontAttributeName: UIFont(name:"AvenirNext-DemiBold", size: CGFloat(14))!]), forState: .Normal)
        }
    }
    
    
    
    
    //TODO: This should technically be in the presenter. Once we start having a user to add to our database we should move this shit.
    func formattedStringForUser(username:String, project:String) -> NSAttributedString {
        
        let fullString = "via \(username) working on \(project)"
        let rangeOfName = (fullString as NSString).rangeOfString(username)
        let rangeOfProject = (fullString as NSString).rangeOfString(project)
        
        let fullAttributedString = NSMutableAttributedString(string: fullString, attributes: [NSForegroundColorAttributeName: UIColor.FLCPlainWhite(),NSFontAttributeName: UIFont(name:"AvenirNext-Regular", size: CGFloat(12))!])
        fullAttributedString.addAttribute(NSFontAttributeName, value: UIFont(name:"AvenirNext-DemiBold", size: CGFloat(12))!, range: rangeOfName)
        fullAttributedString.addAttributes([NSForegroundColorAttributeName: UIColor.FLCElectricBlue(),NSFontAttributeName: UIFont(name:"AvenirNext-DemiBold", size: CGFloat(12))!], range: rangeOfProject)
        
        return fullAttributedString
        
    }

    //MARK:
    //MARK:IBActions
    @IBAction func playPauseButtonDidTouch(sender: FLPlayPauseButton) {
        
        if sender.buttonMode == .Play {
            eventHandler?.pauseButtonDidTouch()
            sender.buttonMode = .Pause
        } else {
            eventHandler?.playButtonDidTouch()
            sender.buttonMode = .Play
        }
    }
    
    @IBAction func likeButtonDidTouch(sender: FLLikeButton) {
        if sender.buttonMode == .Like {
            eventHandler?.unlikeButtonDidTouch()
            sender.buttonMode = .Unlike
        } else {
            eventHandler?.likeButtonDidTouch()
            sender.buttonMode = .Like
        }
    }

}



extension FLPlayerViewController: FLPlayerViewInput {
    
    func setupInterfaceForSong(song:FLSongItem) {
        log.debug("")
        creatorTitleLabel.text = song.creator
        songTitleLabel.text = song.title
        activityLabel.attributedText = formattedStringForUser("Daniel Rakhamimov", project: "FlowList")
    }
    
}