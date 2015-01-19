//
//  FLRootContainerController.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLRootContainerController: UIViewController {
    
    var eventHandler:FLRootContainerViewOutput?
    
    @IBOutlet weak var blurNavBar: FLBlurNavBar!
    @IBOutlet weak var playerContainerView: UIView!
    @IBOutlet weak var feedContainerView: UIView!
    @IBOutlet weak var transparentView: UIView!
    @IBOutlet weak var bottomSpacePlayerContainerViewToSuperView: NSLayoutConstraint!
    @IBOutlet weak var playerTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var feedTapGestureRecognizer: UITapGestureRecognizer!
    
    @IBAction func playerViewDidTap(sender: AnyObject) {
        eventHandler?.playerViewDidRecognizeTap()
        playerTapGestureRecognizer.enabled = false
        feedTapGestureRecognizer.enabled = true
    }
    
    @IBAction func feedViewDidTap(sender: AnyObject) {
        
        eventHandler?.feedViewDidRecognizeTap()
        playerTapGestureRecognizer.enabled = true
        feedTapGestureRecognizer.enabled = false
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.FLCMightnightBlue()
        playerTapGestureRecognizer.enabled = true
        feedTapGestureRecognizer.enabled = false
    
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "presentFeedController" {
            eventHandler?.setupFeedRootModule(segue.destinationViewController as FLFeedRootViewController)
        } else if segue.identifier == "presentPlayerController" {
            eventHandler?.setupPlayerModule(segue.destinationViewController as FLPlayerViewController)
        }
    }

}


extension FLRootContainerController : FLRootContainerViewInput {
    
}
