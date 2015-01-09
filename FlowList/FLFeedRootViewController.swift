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
    var eventHandler:FLFeedPresenter?


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
        
    }
    
    @IBAction func trendingButtonDidTouch(sender: AnyObject) {
        tableViewHeader.listMode = .Trending
    }
    
    @IBAction func likesButtonDidTouch(sender: AnyObject) {
        tableViewHeader.listMode = .Likes
    }
    
    //MARK: Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "embedTrendingVC" {
            (segue.destinationViewController as FLFeedTrendingTableViewController).eventHandler = eventHandler
        }
    }

}



