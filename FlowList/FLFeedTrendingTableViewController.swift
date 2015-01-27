//
//  FLFeedTrendingTableViewController.swift
//  FlowList
//
//  Created by Daniel on 1/9/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

enum ScrollDirection {
    case Up
    case Down
}

class FLFeedTrendingTableViewController: UITableViewController {
    
    //MARK:
    //MARK: Properties
    
    //MARK: Public
    var eventHandler:FLFeedTrendingViewOutput!
    
    //MARK: Private

    private let cellIdentifier = "FeedCell"
    private var songs:[FLTrendingSongItem]?
    private var initialContentOffset:CGFloat = 0

    //MARK:
    //MARK: Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        eventHandler?.initialSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.contentInset = UIEdgeInsetsMake(118, 0, 70, 0)

    }
    
    func setupViews() {
        tableView.separatorColor = UIColor(white: 0, alpha: 0.35)
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.backgroundColor = UIColor.clearColor()
    }
}


//MARK:
//MARK: Extensions

//MARK: Table View Data Source
extension FLFeedTrendingTableViewController: UITableViewDataSource {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let songs = self.songs {
            return songs.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as FLFeedTableCell
        cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? UIColor.FLCHazyBlue() : UIColor.FLCMightnightBlue()
        cell.layoutMargins = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        setupCellForSong(cell, song: songs![indexPath.row])
        return cell
    }
    
    func setupCellForSong(cell:FLFeedTableCell, song:FLTrendingSongItem) {
        cell.creatorLabel.text = song.creator
        cell.titleLabel.text = song.title
    }
    
}

//MARK: Table View Delegate
extension FLFeedTrendingTableViewController: UITableViewDelegate {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let trendingSongItem = songs![indexPath.row] as FLTrendingSongItem
        eventHandler?.queueSong(trendingSongItem)
    }
    
    override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.contentView.backgroundColor = UIColor.FLCElectricBlue()
    }
    
    override func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.contentView.backgroundColor = indexPath.row % 2 == 0 ? UIColor.FLCHazyBlue() : UIColor.FLCMightnightBlue()
    }
    
//    func animateNavBarForMode(mode: NavBarMode, value: CGFloat, shouldAnimate: Bool) {
//        
//        let initialHeight = navBar.bounds.size.height
//        let dragCoefficient:CGFloat = 0.25
//        let collapsedHeight = ((initialHeight - (value * dragCoefficient)) < 20) ? 20 : initialHeight - (value * dragCoefficient)
//        let expandedHeight = ((initialHeight + (value * dragCoefficient)) > 64) ? 64 : initialHeight + (value * dragCoefficient)
//        
//        if shouldAnimate {
//            UIView.animateWithDuration(0.15) {
//                self.navBar.frame = CGRectMake(0, 0, self.navBar.bounds.size.width, mode == .Expanded ? expandedHeight : collapsedHeight)
//            }
//        } else {
//            self.navBar.frame = CGRectMake(0, 0, self.navBar.bounds.size.width, mode == .Expanded ? expandedHeight : collapsedHeight)
//        }
//    }
    
    
    func isScrollViewBouncing(scrollView:UIScrollView) -> Bool {
        return scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height && scrollView.contentSize.height > scrollView.frame.size.height
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y > 0  {
            
            //            println("Initial Content Offset:\(abs(initialContentOffset))")
            //            println("Scroll View Content Offset:\(abs(scrollView.contentOffset.y))")
            
            
            var dragValue = abs(abs(initialContentOffset) - abs(scrollView.contentOffset.y))
            
            if scrollView.contentOffset.y > initialContentOffset {
                
                eventHandler?.scrollViewDidScrollWithDragValue(dragValue, direction: .Down)
//                if navBar.bounds.size.height != 20 {
//                    println(dragValue)
//                    animateNavBarForMode(.Collapsed, value: dragValue, shouldAnimate:false)
//                }
            } else if scrollView.contentOffset.y < initialContentOffset {
                
                if isScrollViewBouncing(scrollView) == false {
                    eventHandler?.scrollViewDidScrollWithDragValue(dragValue, direction: .Up) }
                
//                if navBar.bounds.size.height != 64 && isScrollViewBouncing(scrollView) == false {
//                    animateNavBarForMode(.Expanded, value: dragValue, shouldAnimate:false)
//                }
            }
            
            initialContentOffset = scrollView.contentOffset.y
            
            
        } else {
            
//            let expandedHeight:CGFloat = 64.0
//            
//            if navBar.bounds.size.height != expandedHeight {
//                UIView.animateWithDuration(0.15,
//                    delay: 0.0,
//                    options: .BeginFromCurrentState,
//                    animations: { () -> Void in
//                        self.navBar.frame = CGRectMake(0, 0, self.navBar.bounds.size.width, expandedHeight)
//                    }) { (success:Bool) -> Void in
//                        //
//                }
//                
//            }
//            
//        }
        
    }
        
}
    
    override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        if scrollView.decelerating == false {
            initialContentOffset = 1.0
        }
        
    }
    
    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
//        let expandedHeight = 64
//        let collapsedHeight = 20
//        let velocity = scrollView.panGestureRecognizer.velocityInView(view.superview)
//        var newHeight:Int = 0
//        
//        if velocity.y < 20 {
//            newHeight = collapsedHeight
//        } else if velocity.y > 40 {
//            newHeight = expandedHeight
//        }
//        
//        
//        UIView.animateWithDuration(0.15,
//            delay: 0.0,
//            options: .BeginFromCurrentState,
//            animations: { () -> Void in
//                self.navBar.frame = CGRectMake(0, 0, self.navBar.bounds.size.width, CGFloat(newHeight))
//            }) { (success:Bool) -> Void in
//                //
        }
}





//MARK: Feed View Input
extension FLFeedTrendingTableViewController: FLFeedTrendingViewInput {
    
    func showTrendingSongs(songs:[FLTrendingSongItem]) {
        self.songs = songs
        tableView.reloadData()
    }
}


