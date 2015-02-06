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
    
    //MARK: IBOutlets
    @IBOutlet weak var transparentView: UIView!
    @IBOutlet weak var playerContainerView: UIView!
    @IBOutlet weak var blurNavBar: FLBlurNavBar!
    
    //MARK: Constraints
    @IBOutlet var centerXTrendingViewToSuperView: NSLayoutConstraint!
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
        blurNavBar.feedHeaderView.listMode = .New
        animateForConstant(-view.bounds.size.width)
    }
    
    @IBAction func trendingButtonDidTouch(sender: AnyObject) {
        blurNavBar.feedHeaderView.listMode = .Trending
        animateForConstant(0)
    }
    
    @IBAction func likesButtonDidTouch(sender: AnyObject) {
        blurNavBar.feedHeaderView.listMode = .Likes
        println(view.bounds)
        animateForConstant(view.bounds.size.width)
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
    
    
    func animateForConstant(constant:CGFloat) {

        centerXTrendingViewToSuperView.constant = constant
        
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
    
}

extension FLFeedRootViewController: FLFeedRootViewInput {
    
    func expandNavBarWithValue(value:CGFloat) {
        if blurNavBar.mode != .Expanded  {
            blurNavBar.expandWithValue(value)
        }
    }
    
    func collapseNavBarWithValue(value:CGFloat) {
        if blurNavBar.mode != .Collapsed {
            blurNavBar.collapseWithValue(value)
        }
    }
    
    func finishNavBarTransition() {
        
        if blurNavBar.mode == .Animating {
            if blurNavBar.heightConstraint.constant <= (blurNavBar.expandedHeight / 2) {
                blurNavBar.fullyCollapse()
            } else {
                blurNavBar.fullyExpand()
            }
        }
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



