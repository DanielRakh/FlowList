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
    private var currentNavBarHeight = 0
    private var navBarIsInTransition = false
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
//            initialNavBarExpansionContentOffset = scrollView.contentOffset.y
        }
    }
    
    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        println("targetContentOffset:\(targetContentOffset.memory.y)")

//        if scrollVelocity.y > 20 {
//            eventHandler?.scrollViewWillEndDraggingScrollingDown()
//        } else if scrollVelocity.y > 40 {
//            eventHandler?.scrollViewWillEndDraggingScrollingUp()
//        }
        
        
        // User releases: If we're in mid collapse/expansion: grab the offset between the start point and end point of the animation and offset the view accordingly.
        // If the view is soff s
        
        
        if targetContentOffset.memory.y >= scrollView.contentOffset.y {
            
        }
        
        
        if scrollView.contentOffset.y <= 0 {
            
            // If we're still at the top of the feed.
            if scrollView.contentOffset.y <= -(topContentInset / 2) && targetContentOffset.memory.y <= initialContentOffset {
                //Animate nav bar to expansion.
                //Scroll feed to -contentInset
                scrollView.setContentOffset(CGPointMake(scrollView.contentOffset.x, -topContentInset), animated: true)
                eventHandler?.scrollViewWillEndDraggingScrollingUp()
                

            } else if scrollView.contentOffset.y >= -(topContentInset / 2) && targetContentOffset.memory.y >= initialContentOffset {
                println("Top half")
                //Animate nav bar to collapse
                scrollView.setContentOffset(CGPointMake(scrollView.contentOffset.x, -20), animated: true)
                eventHandler?.scrollViewWillEndDraggingScrollingDown()

            }
            
        } else {
         
            if navBarMode == .Collapse {
                
//                if (targetContentOffset.memory.y - scrollView.contentOffset.y) > topContentInset / 2  {
//                    eventHandler?.scrollViewWillEndDraggingScrollingDown()
//                    
//                } else if (targetContentOffset.memory.y - scrollView.contentOffset.y) <= topContentInset / 2 {
//                    eventHandler?.scrollViewWillEndDraggingScrollingUp()
//                    scrollView.setContentOffset(CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y), animated: true)
//                }
                
                
            } else if navBarMode == .Expand {
                
                if (targetContentOffset.memory.y - scrollView.contentOffset.y) > topContentInset / 2  {
                    eventHandler?.scrollViewWillEndDraggingScrollingDown()

                } else if (targetContentOffset.memory.y - scrollView.contentOffset.y) <= topContentInset / 2  {
                    eventHandler?.scrollViewWillEndDraggingScrollingUp()
                    scrollView.setContentOffset(CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y), animated: true)
                }
                
            }
            
            
            
        }
        
        
    }
    
}


//MARK: Feed View Input
extension FLFeedTrendingTableViewController: FLFeedTrendingViewInput {
    
    func showTrendingSongs(songs:[FLTrendingSongItem]) {
        self.songs = songs
        tableView.reloadData()
    }
}


