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
    @IBOutlet weak var blurStatusBar: FLBlurStatusBar!
    
    //MARK: Constraints
    @IBOutlet weak var centerXTrendingViewToSuperView: NSLayoutConstraint!
    @IBOutlet weak var bottomSpacePlayerContainerViewToSuperView: NSLayoutConstraint!
    @IBOutlet weak var verticalSpaceStatusBarToNavBar: NSLayoutConstraint!
    
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
    
    //MARK: Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "embedTrendingVC" {
            eventHandler?.setupFeedTrendModuleForViewController(segue.destinationViewController as FLFeedTrendingTableViewController)
        } else if segue.identifier == "embedNewVC"  {
            eventHandler?.setupFeedNewModuleForViewController(segue.destinationViewController as FLFeedNewTableViewController)
        } else if segue.identifier == "embedLikesVC" {
            eventHandler?.setupFeedLikesModuleForViewController(segue.destinationViewController as FLFeedLikesTableViewController)
        } else if segue.identifier == "presentPlayerController" {
            eventHandler?.setupPlayerModule(segue.destinationViewController as FLPlayerViewController)
        }
    }
    
    
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
    
    func hideNavBarWithValue(value:CGFloat) {
        
        verticalSpaceStatusBarToNavBar.constant -= value
        
        println("Hide Value:\(value)")
        
        let subViewAnimatedValue = value / 50
        
        
        UIView.animateWithDuration(0.1,
            delay: 0.0,
            options: .BeginFromCurrentState,
            animations: { () -> Void in
                self.blurNavBar.titleLabel.alpha -= subViewAnimatedValue * 3.0
                self.blurNavBar.feedHeaderView.alpha -= subViewAnimatedValue
                self.blurNavBar.hairlineView.alpha -= subViewAnimatedValue
                //                self.blurNavBar.titleLabel.transform -= CGAffineTransformMakeScale(subViewAnimatedValue, subViewAnimatedValue)
                self.view.layoutIfNeeded()
            }) { (success:Bool) -> Void in
                //
        }
        
        
    }
    
    func revealNavBarWithValue(value:CGFloat) {
        verticalSpaceStatusBarToNavBar.constant += value
        
        let subViewAnimatedValue = value / 50
        
        println("Reveal Value:\(value)")
        
        UIView.animateWithDuration(0.1,
            delay: 0.0,
            options: .BeginFromCurrentState,
            animations: { () -> Void in
                self.blurNavBar.titleLabel.alpha += subViewAnimatedValue
                self.blurNavBar.feedHeaderView.alpha += subViewAnimatedValue
                self.blurNavBar.hairlineView.alpha += subViewAnimatedValue
                //                self.blurNavBar.titleLabel.transform = CGAffineTransformMakeScale(subViewAnimatedValue, subViewAnimatedValue)
                self.view.layoutIfNeeded()
            }) { (success:Bool) -> Void in
                //
        }
    }
    
    
}

//MARK:
//MARK: Extensions

extension FLFeedRootViewController: FLFeedRootViewInput {
    
    func expandNavBarWithValue(value:CGFloat) {
        //        if blurNavBar.mode != NavBarMode.Expanded  {
        //            blurNavBar.expandWithValue(value)
        //        }
        println(value)
        revealNavBarWithValue(value)
    }
    
    func collapseNavBarWithValue(value:CGFloat) {
        //        if blurNavBar.mode != NavBarMode.Collapsed {
        //            blurNavBar.collapseWithValue(value)
        //        }
        println(value)
        hideNavBarWithValue(value)
    }
    
    func finishNavBarTransition() {
        
        //        if blurNavBar.transitioning == true {
        //        println(blurNavBar.heightConstraint.constant)
        //            if blurNavBar.heightConstraint.constant <= (blurNavBar.expandedHeight / 2) {
        //                blurNavBar.fullyCollapse(true, shouldCallDelegate: true)
        //            } else {
        //                blurNavBar.fullyExpand(true, shouldCallDelegate: true)
        //            }
        //        }
    }
    
    func startNavBarTransition() {
        //        if blurNavBar.transitioning == false{
        //            blurNavBar.transitioning = true
        //        println(blurNavBar.transitioning)
        
        //        }
    }
    
    func collapseNavBar() {
        //        blurNavBar.fullyCollapse(true, shouldCallDelegate: false)
    }
    
    func expandNavBar() {
        //        blurNavBar.fullyExpand(true, shouldCallDelegate: false)
    }
}


extension FLFeedRootViewController: FLBlurNavBarDelegate {
    
    func navBarExpandedBy(height:CGFloat) {
        eventHandler?.navBarHasExpandedBy(height)
    }
    
    func navBarCollapsedBy(height:CGFloat) {
        eventHandler?.navBarHasCollapsedBy(height)
    }
    
}



