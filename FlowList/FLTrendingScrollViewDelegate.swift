//
//  FLTrendingScrollViewDelegate.swift
//  FlowList
//
//  Created by Daniel on 1/26/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import Foundation


protocol FLTrendingScrollViewDelegate {
    
    func userDidScrollDirection(direction:ScrollDirection, dragValue:CGFloat)
    
//    func userDidScrollFullyUp()
//    func userDidScrollFullyDown()
    func scrollViewWillEndDragging(direction:ScrollDirection?)
    func scrollViewWillBeginDragging()
}



/*
    UX:
    
    
    NavBar Modes:
    
    Collapsed,
    Expanded,
    Animating
    
    
    
    
    In userDidBeginDrag:
    
    
    
    
    In scrollViewDidScroll:
    
        if user is dragging the scrollView
    
            check direction of drag,
    
                if down,
                    if nav bar != collapsed,
                        set navbar to animating mode.
                        keep passing in value to collapse by.
                if up,
                    if nav bar != expanded,
                        if the scrollView has went up past a certain threshold,
                            set navBar to animating mode
                            keep passing in value to expand by.
    
    
    
    This means that the nav bar can expand and collapse based on user input. Once the nav bar reaches collapsed height it enters collapsed mode. Once it reaches expanded height it enters expanded mode. We know this

    
    In scrollViewWillEndDragging:
    
        if nav bar is animating mode,
            tell the navbar I'm done animating
                The navbar class should then check what half it's currently on,
                animate with respect to that half & return offset and current mode
        
    
    In scrollViewDidEndDragging:
        ScrollView should offset according the value returned in scrollViewWillEndDragging.





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
    











*/

