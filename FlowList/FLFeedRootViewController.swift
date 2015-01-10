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
    @IBOutlet weak var tableViewHeader: FLFeedHeaderView!
    @IBOutlet var centerXTrendingViewToSuperView: NSLayoutConstraint!
    
    //MARK:
    //MARK: Methods
    
    //MARK: Initial Helpers

    func setupViews() {
        view.backgroundColor = UIColor.FLCMightnightBlue()
    }
    
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    //MARK: IBAction
    
    @IBAction func newButtonDidTouch(sender: AnyObject) {
        tableViewHeader.listMode = .New
        animateForConstant(-view.bounds.size.width)
    }
    
    @IBAction func trendingButtonDidTouch(sender: AnyObject) {
        tableViewHeader.listMode = .Trending
        animateForConstant(0)
    }
    
    @IBAction func likesButtonDidTouch(sender: AnyObject) {
        tableViewHeader.listMode = .Likes
        animateForConstant(view.bounds.size.width)
    }
    
    //MARK: Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "embedTrendingVC" {
            eventHandler?.setupFeedTrendModuleForViewController(segue.destinationViewController as FLFeedTrendingTableViewController)
        } else if segue.identifier == "embedNewVC"  {
            eventHandler?.setupFeedNewModuleForViewController(segue.destinationViewController as FLFeedNewTableViewController)
        } else if segue.identifier == "embedLikesVC" {
            eventHandler?.setupFeedLikesModuleForViewController(segue.destinationViewController as FLFeedLikesTableViewController)            
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
    
}



