//
//  FLFeedTrendingTableViewController.swift
//  FlowList
//
//  Created by Daniel on 1/9/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit


class FLFeedTrendingTableViewController: UITableViewController {
    
    //MARK:
    //MARK: Properties
    
    //MARK: Public
    var eventHandler:FLFeedTrendingViewOutput!
    
    //MARK: Private
    
    private let cellIdentifier = "FeedCell"
    private let topContentInset = 110 as CGFloat
    private let bottomContentInset = 70 as CGFloat
    
    private var songs:[FLTrendingSongItem]?
    private var initialContentOffset:CGFloat = 0
    private var initialTargetContentOffset:CGFloat = -110.0
    private var initialNavBarExpansionContentOffset:CGFloat = 0
    private var initialNavBarDragContentOffset:CGFloat = 0
    
    
    
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! FLFeedTableCell
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
        
        if scrollView.dragging && scrollView.tracking && scrollView.contentOffset.y > -topContentInset && isScrollViewBouncing(scrollView) == false {
            // In the bounds of scrolling

            var dragValue = Float(abs(abs(initialContentOffset) - abs(scrollView.contentOffset.y)))
            
            if scrollView.contentOffset.y > initialContentOffset {
                
                // Scrolling down (dragging up)
                println("Scrolling DOWN with CO:\(scrollView.contentOffset.y) and initialCO:\(initialContentOffset)")
                eventHandler?.scrollViewDidScrollWithDragValue(dragValue, direction: .Down)
                initialNavBarExpansionContentOffset = scrollView.contentOffset.y
                
            } else if scrollView.contentOffset.y < initialContentOffset {
                // Scrolling up (dragging down)
                println("Scrolling UP with CO:\(scrollView.contentOffset.y) and initialCO:\(initialContentOffset)")
                if scrollView.contentOffset.y > 0 {
                    if (initialNavBarExpansionContentOffset - scrollView.contentOffset.y) > CGRectGetHeight(view.bounds) / 2 {
                        eventHandler?.scrollViewDidScrollWithDragValue(dragValue, direction: .Up)
                    }
                }
                else {
                    eventHandler?.scrollViewDidScrollWithDragValue(dragValue, direction: .Up)
                }
                
            }
            
            initialContentOffset = scrollView.contentOffset.y
            
        }
        
    }
    
    override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        initialContentOffset = scrollView.contentOffset.y
        initialNavBarExpansionContentOffset = scrollView.contentOffset.y
        eventHandler?.userWillBeginDragging()
    }
    
    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        /*
            If the user ended dragging.
        */
        
        println("Velocity:\(velocity)")
        println("TargetCOY:\(targetContentOffset.memory.y)")
        println("InitialCOY:\(initialTargetContentOffset)")
        println("Abs Diff \(abs(abs(targetContentOffset.memory.y) - abs(initialTargetContentOffset)))")
        
        let absDiff = (abs(abs(targetContentOffset.memory.y) - abs(initialTargetContentOffset)))
        
        
        if targetContentOffset.memory.y > initialTargetContentOffset && isScrollViewBouncing(scrollView) == false {
            
            println("In scroll down block")

            
                if velocity.y <= 0.5 && velocity.y >= 0 {
                    println("Ended Weakly Scrolling Down")
                    eventHandler?.userWillEndDraggingWeakly(direction: .Down)
                } else {
                    println("Ended Scrolling Down")
                    eventHandler?.userWillEndDragging(.Down)
                }
    
        } else if targetContentOffset.memory.y <= initialTargetContentOffset && isScrollViewBouncing(scrollView) == false {
            
            println("In scroll up block")
            
            if velocity.y >= -0.1 {
                println("Ended Weakly direction NIL")
                eventHandler?.userWillEndDraggingWeakly(direction: nil)
                
            } else {
                eventHandler?.userWillEndDragging(.Up)
                println("Ended Scrolling up")
            }
            
        } else if isScrollViewBouncing(scrollView) == true {
            if targetContentOffset.memory.y == -(topContentInset) {
                eventHandler?.userWillEndDragging(.Up)
            } else {
                eventHandler?.userWillEndDragging(.Down)
            }
        }
        
  
        
        initialTargetContentOffset = targetContentOffset.memory.y
    }
    
}


//MARK: Feed View Input
extension FLFeedTrendingTableViewController: FLFeedTrendingViewInput {
    
    func showTrendingSongs(songs:[FLTrendingSongItem]) {
        self.songs = songs
        tableView.reloadData()
    }
    
    func offSetScrollViewBy(value:Float) {
        self.tableView.setContentOffset(CGPointMake(tableView.contentOffset.x, tableView.contentOffset.y - CGFloat(value)), animated: true)
    }
    
    
}


