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
    
    private let expandedNavBarHeight:CGFloat = 118
    private let collapsedNavBarHeight:CGFloat = 20


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
        
//        let initialAlpha = (heightNavBar.constant - 18) / 100
        let initialHeight = heightNavBar.constant
        let dragCoefficient:CGFloat = 0.25
        let collapsedHeight = ((initialHeight - (value * dragCoefficient)) < collapsedNavBarHeight) ? collapsedNavBarHeight : initialHeight - (value * dragCoefficient)
        let expandedHeight = ((initialHeight + (value * dragCoefficient)) > expandedNavBarHeight) ? expandedNavBarHeight : initialHeight + (value * dragCoefficient)
        
        blurNavBar.titleLabel.alpha = mode == .Expand ? ((expandedHeight - 18) / 100) : ((collapsedHeight - 18) / 100)
        blurNavBar.feedHeaderView.alpha = mode == .Expand ? ((expandedHeight - 18) / 100) : ((collapsedHeight - 18) / 100)

        heightNavBar.constant = mode == .Expand ? expandedHeight : collapsedHeight
        view.layoutIfNeeded()

    }
}

extension FLFeedRootViewController: FLFeedRootViewInput {
    
    func expandNavBarWithValue(value:CGFloat) {
        if heightNavBar.constant != expandedNavBarHeight {
            transitionNavBarForMode(.Expand, navBar: blurNavBar, value: value)
        }

    }
    
    func collapseNavBarWithValue(value:CGFloat) {
        if heightNavBar.constant != collapsedNavBarHeight {
            transitionNavBarForMode(.Collapse, navBar: blurNavBar, value: value)
        }
    }

    func fullyExpandNavBar() {
        if heightNavBar.constant != expandedNavBarHeight {
            heightNavBar.constant = expandedNavBarHeight
            UIView.animateWithDuration(0.15, animations: { () -> Void in
                self.blurNavBar.titleLabel.alpha = 1.0
                self.blurNavBar.feedHeaderView.alpha = 1.0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    func fullyCollapseNavBar() {
        if heightNavBar.constant != collapsedNavBarHeight {
            heightNavBar.constant = collapsedNavBarHeight
            UIView.animateWithDuration(0.15, animations: { () -> Void in
                self.blurNavBar.titleLabel.alpha = 0.0
                self.blurNavBar.feedHeaderView.alpha = 0.0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
}




