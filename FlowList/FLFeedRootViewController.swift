//
//  FLFeedViewController.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit


enum NavBarMode {
    case Collapse
    case Expand
}

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
    @IBOutlet weak var heightNavBar: NSLayoutConstraint!
    
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
    
    
    func transitionNavBarForMode(mode: NavBarMode, navBar:UIView, value: CGFloat) {
        
        let initialHeight = heightNavBar.constant
        let dragCoefficient:CGFloat = 0.25
        let collapsedHeight = ((initialHeight - (value * dragCoefficient)) < 20) ? 20 : initialHeight - (value * dragCoefficient)
        let expandedHeight = ((initialHeight + (value * dragCoefficient)) > 118) ? 118 : initialHeight + (value * dragCoefficient)
        
        heightNavBar.constant = mode == .Expand ? expandedHeight : collapsedHeight
        view.layoutIfNeeded()

//            navBar.frame = CGRectMake(0, 0, navBar.bounds.size.width, mode == .Expand ? expandedHeight : collapsedHeight)
    }
}

extension FLFeedRootViewController: FLFeedRootViewInput {
    
    func expandNavBarWithValue(value:CGFloat) {
        if heightNavBar.constant != 118 {
            transitionNavBarForMode(.Expand, navBar: blurNavBar, value: value)
        }

    }
    
    func collapseNavBarWithValue(value:CGFloat) {
        if heightNavBar.constant != 20 {
            transitionNavBarForMode(.Collapse, navBar: blurNavBar, value: value)
        }
    }
    
    
}




