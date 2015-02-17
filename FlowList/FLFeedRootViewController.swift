//
//  FLFeedViewController.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit


class FLFeedRootViewController: UIViewController {
    
    //MARK:
    //MARK: Properties
    
    //MARK: Public
    var eventHandler:FLFeedRootPresenter?
    
    //MARK: Private
    private var mode:FLVisibleFeedMode = .Trending {
        willSet {
            blurNavBar.feedHeaderView.feedMode = newValue
            animateVisibleFeedForMode(newValue)
        }
    }
    
    //MARK: IBOutlets
    @IBOutlet weak var transparentView: UIView!
    @IBOutlet weak var playerContainerView: UIView!
    @IBOutlet weak var blurNavBar: FLBlurNavBar!
    
    //MARK: Constraints
    @IBOutlet weak var centerXTrendingViewToSuperView: NSLayoutConstraint!
    @IBOutlet weak var bottomSpacePlayerContainerViewToSuperView: NSLayoutConstraint!
    
    //MARK: Gesture Recognizers
    @IBOutlet weak var playerTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var feedTapGestureRecognizer: UITapGestureRecognizer!
    
    
    //MARK:
    //MARK: Methods
    
    //MARK: Initial Helpers
    
    func setupViews() {
        view.backgroundColor = UIColor.FLCMightnightBlue()
        playerTapGestureRecognizer.enabled = true
        feedTapGestureRecognizer.enabled = false
        blurNavBar.delegate = self
    }
    
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    //MARK: IBAction
    
    @IBAction func newButtonDidTouch(sender: AnyObject) {
        if mode != .New {
            mode = .New
        }
    }
    
    @IBAction func trendingButtonDidTouch(sender: AnyObject) {
        if mode != .Trending {
            mode = .Trending
        }
    }
    
    @IBAction func likedButtonDidTouch(sender: AnyObject) {
        if mode != .Liked {
            mode = .Liked
        }
    }
    
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
    
    @IBAction func playerViewDidPan(sender: UIPanGestureRecognizer) {
        log.d
    }
    
    //MARK: Animation
    
    func animateVisibleFeedForMode(mode:FLVisibleFeedMode) {
        
        var newCenterXConstant:CGFloat
        
        switch mode {
        case .New:
            newCenterXConstant = -view.bounds.size.width
        case .Trending:
            newCenterXConstant = 0
        case .Liked:
            newCenterXConstant = view.bounds.size.width
        }
        
        centerXTrendingViewToSuperView.constant = newCenterXConstant
        
        UIView.animateWithDuration(0.35, delay: 0.0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.2,
            options: .CurveEaseInOut,
            animations: { () -> Void in
                self.view.layoutIfNeeded()
            }) { (success:Bool) -> Void in
                //
        }
    }

    //MARK: Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "embedTrendingVC" {
            eventHandler?.setupFeedTrendModuleForViewController(segue.destinationViewController as! FLFeedTrendingTableViewController)
        } else if segue.identifier == "embedNewVC"  {
            eventHandler?.setupFeedNewModuleForViewController(segue.destinationViewController as! FLFeedNewTableViewController)
        } else if segue.identifier == "embedLikesVC" {
            eventHandler?.setupFeedLikesModuleForViewController(segue.destinationViewController as! FLFeedLikesTableViewController)
        } else if segue.identifier == "presentPlayerController" {
            eventHandler?.setupPlayerModule(segue.destinationViewController as! FLPlayerViewController)
        }
    }
    
}

//MARK:
//MARK: Extensions

extension FLFeedRootViewController: FLFeedRootViewInput {
    
    func expandNavBarWithValue(value:Float) {
        if blurNavBar.mode != .Expanded  {
            blurNavBar.expandWithValue(value)
        }
    }
    
    func collapseNavBarWithValue(value:Float) {
        if blurNavBar.mode != .Collapsed {
            blurNavBar.collapseWithValue(value)
        }
    }
    
    func finishNavBarTransition() {
        
                if blurNavBar.transitioning == true {
                    if Float(blurNavBar.heightConstraint.constant) <= (blurNavBar.expandedHeight / 2) {
                        blurNavBar.fullyCollapse(true, shouldCallDelegate: true)
                    } else {
                        blurNavBar.fullyExpand(true, shouldCallDelegate: true)
                    }
                }
    }
    
    func startNavBarTransition() {
                if blurNavBar.transitioning == false{
                    blurNavBar.transitioning = true        
                }
    }
    
    func collapseNavBar(#returnOffset:Bool) {
        println("Collapse Nav Bar")
                blurNavBar.fullyCollapse(true, shouldCallDelegate: returnOffset)
    }
    
    func expandNavBar(#returnOffset:Bool) {
                blurNavBar.fullyExpand(true, shouldCallDelegate: returnOffset)
    }
}


extension FLFeedRootViewController: FLBlurNavBarDelegate {
    
    func navBarExpandedBy(height:Float) {
        eventHandler?.navBarHasExpandedBy(height)
    }
    
    func navBarCollapsedBy(height:Float) {
        eventHandler?.navBarHasCollapsedBy(height)
    }
    
}



