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
        setupNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        playerTapGestureRecognizer.enabled = true
        feedTapGestureRecognizer.enabled = false
    
    }
    
    func setupNavigationBar() {
        
        let titleLabel = UILabel()
        
        let attrString = NSAttributedString(
            string: "</FLOWLIST>",
            attributes:
            [NSForegroundColorAttributeName: UIColor.FLCElectricBlue(),
                NSKernAttributeName: 2,
                NSFontAttributeName: UIFont(name:"AvenirNext-DemiBold", size: CGFloat(20))!] as NSDictionary)
        titleLabel.attributedText = attrString
        titleLabel.sizeToFit()
        navigationItem.titleView = titleLabel
        
        createTestBarButton()
        
    }
    
    func createTestBarButton() {
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("hitApi"))
        navigationItem.rightBarButtonItem = addItem
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
