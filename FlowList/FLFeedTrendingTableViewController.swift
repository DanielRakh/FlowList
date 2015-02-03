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
    private let topContentInset = 118 as CGFloat
    private let bottomContentInset = 70 as CGFloat
    
    private var songs:[FLTrendingSongItem]?
    private var initialContentOffset:CGFloat = 0
    private var initialNavBarExpansionContentOffset:CGFloat = 0
    private var initialNavBarDragContentOffset:CGFloat = 0
    private var navBarMode:NavBarMode = .Expand
    
    
    
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
        tableView.contentInset = UIEdgeInsetsMake(topContentInset, 0, bottomContentInset, 0)
        
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
        return false
    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath)
//        cell?.contentView.backgroundColor = UIColor.FLCElectricBlue()
    }
    
    override func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.contentView.backgroundColor = indexPath.row % 2 == 0 ? UIColor.FLCHazyBlue() : UIColor.FLCMightnightBlue()
    }
}


extension FLFeedTrendingTableViewController: UIScrollViewDelegate {
    
    func isScrollViewBouncing(scrollView:UIScrollView) -> Bool {
        return scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height && scrollView.contentSize.height > scrollView.frame.size.height
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
        
        if scrollView.contentOffset.y > -topContentInset && isScrollViewBouncing(scrollView) == false {
            //In the bounds of the scroll.
            
            var dragValue = abs(abs(initialContentOffset) - abs(scrollView.contentOffset.y))
            
            //            println("Initial Content Offset\(initialContentOffset)")
            //            println("Scroll View Content offset:\(scrollView.contentOffset.y)")
            
            if scrollView.contentOffset.y > initialContentOffset {
                
                eventHandler?.scrollViewDidScrollWithDragValue(dragValue, direction: .Down)
                
                initialNavBarExpansionContentOffset = scrollView.contentOffset.y
                
                navBarMode = .Collapse
                
                
            } else if scrollView.contentOffset.y < initialContentOffset {
                
                if scrollView.contentOffset.y > topContentInset {
                    
                    if (initialNavBarExpansionContentOffset - scrollView.contentOffset.y) > CGRectGetHeight(view.bounds) / 2 {
                        eventHandler?.scrollViewDidScrollWithDragValue(dragValue, direction: .Up)
                        navBarMode = .Expand
                        println("EXPANDED!")
                    }
                    
                } else {
                    
                    eventHandler?.scrollViewDidScrollWithDragValue(dragValue, direction: .Up)
                }
                
            }
            
            initialContentOffset = scrollView.contentOffset.y
            
        }
        
    }
    
    override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        if scrollView.decelerating == false {
            initialContentOffset = scrollView.contentOffset.y
            initialNavBarExpansionContentOffset = scrollView.contentOffset.y
            initialNavBarDragContentOffset = scrollView.contentOffset.y
        }
    }
    
    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        //        println("targetContentOffset:\(targetContentOffset.memory.y)")
        
        //        if scrollVelocity.y > 20 {
        //            eventHandler?.scrollViewWillEndDraggingScrollingDown()
        //        } else if scrollVelocity.y > 40 {
        //            eventHandler?.scrollViewWillEndDraggingScrollingUp()
        //        }
        
        
        // User releases: If we're in mid collapse/expansion: grab the offset between the start point and end point of the animation and offset the view accordingly.
        // If the view is soff s
        
        //       println("Velocity:\(velocity)")
        
        if scrollView.contentOffset.y <= topContentInset {
            
            // If we're still at the top of the feed.
            if scrollView.contentOffset.y <= -(topContentInset / 2) {
                //Animate nav bar to expansion.
                //Scroll feed to -contentInset
                scrollView.setContentOffset(CGPointMake(scrollView.contentOffset.x, -topContentInset), animated: true)
                eventHandler?.scrollViewWillEndDraggingScrollingUp()
                
                
            } else if scrollView.contentOffset.y >= -(topContentInset / 2)  {
                //Animate nav bar to collapse
                scrollView.setContentOffset(CGPointMake(scrollView.contentOffset.x, -20), animated: true)
                eventHandler?.scrollViewWillEndDraggingScrollingDown()
                
            }
            
        }
            
            
            
        else {
            
//            if targetContentOffset.memory.y == scrollView.contentOffset.y {
            
                if navBarMode == .Expand && isScrollViewBouncing(scrollView) == false  {
                    //
                    eventHandler?.scrollViewWillEndDraggingScrollingUp()
                    //
                    //
                } else if navBarMode == .Collapse && isScrollViewBouncing(scrollView) == false && scrollView.decelerating == false  && velocity.y == 0{
                    
                    println("TARGET OFFSET:\(targetContentOffset.memory.y)")
                    println("SCROLL VIEW OFFSET:\(scrollView.contentOffset.y)")
                    
                    if scrollView.contentOffset.y - initialNavBarDragContentOffset <= (topContentInset / 3) && scrollView.contentOffset.y - initialNavBarDragContentOffset > 0  {
                        println(scrollView.contentOffset.y - initialNavBarDragContentOffset)
                        scrollView.setContentOffset(CGPointMake(scrollView.contentOffset.x, initialNavBarDragContentOffset), animated: true)
                        eventHandler?.scrollViewWillEndDraggingScrollingUp()
                        println("EXPAND!")
                    } else if scrollView.contentOffset.y - initialNavBarDragContentOffset >= (topContentInset / 3) && scrollView.contentOffset.y - initialNavBarDragContentOffset < topContentInset {
                        println("COLLAPSE!")
                        scrollView.setContentOffset(CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y + (scrollView.contentOffset.y - initialNavBarDragContentOffset)), animated: true)
                        eventHandler?.scrollViewWillEndDraggingScrollingDown()
                    }
                    
                }
                
//            }
            
        }
        
        
        
    }
    
    
    
    //    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    //
    //        if scrollView.contentOffset.y > 0 {
    //
    //            if navBarMode == .Collapse {
    //                if decelerate == false {
    //                    if scrollView.contentOffset.y - initialNavBarDragContentOffset <= (topContentInset / 2) {
    //                        eventHandler?.scrollViewWillEndDraggingScrollingUp()
    //                        println("EXPAND!")
    //                    } else {
    //                        println("COLLAPSE!")
    //                        eventHandler?.scrollViewWillEndDraggingScrollingDown()
    //                    }
    //
    //                }
    //            }
    //        }
    //
    //    }
    
    
}


//MARK: Feed View Input
extension FLFeedTrendingTableViewController: FLFeedTrendingViewInput {
    
    func showTrendingSongs(songs:[FLTrendingSongItem]) {
        self.songs = songs
        tableView.reloadData()
    }
}


