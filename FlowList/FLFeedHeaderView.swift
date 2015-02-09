//
//  FLFeedHeaderView.swift
//  FlowList
//
//  Created by Daniel on 1/6/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedHeaderView: UIView {
    
    var feedMode:FLVisibleFeedMode = .Trending {
        willSet {
            performAnimationsForMode(newValue)
        }
    }
    
    @IBOutlet weak var underlineView:UIView!
    @IBOutlet weak var newButton:UIButton!
    @IBOutlet weak var trendingButton:UIButton!
    @IBOutlet weak var likesButton:UIButton!
    //Constraints
    var centerXAlignUnderlineToNewButton:NSLayoutConstraint?
    var equalWidthUnderlineToNewButton:NSLayoutConstraint?
    @IBOutlet var centerXAlignUnderlineToTrendingButton:NSLayoutConstraint!
    @IBOutlet var equalWidthUnderlineToTrendingButton:NSLayoutConstraint!
    var centerXAlignUnderlineToLikesButton:NSLayoutConstraint?
    var equalWidthUnderlineToLikesButton:NSLayoutConstraint?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        
        backgroundColor = UIColor.clearColor()
        trendingButton.setTitleColor(UIColor.FLCPlainWhite(), forState: .Normal)
        likesButton.setTitleColor(UIColor.FLCUnselectedGray(), forState: .Normal)
        newButton.setTitleColor(UIColor.FLCUnselectedGray(), forState: .Normal)
        underlineView.backgroundColor = UIColor.FLCElectricBlue()
    }
    
    override func updateConstraints() {
        if (centerXAlignUnderlineToNewButton == nil && equalWidthUnderlineToNewButton == nil || centerXAlignUnderlineToLikesButton == nil && equalWidthUnderlineToLikesButton == nil ) {
            setupConstraints()
        }
        super.updateConstraints()
    }
    
    func performAnimationsForMode(feedMode:FLVisibleFeedMode) {
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        adjustConstraintsForMode(feedMode)
        
        UIView.animateWithDuration(0.35, delay: 0.0, usingSpringWithDamping:0.7, initialSpringVelocity:0.5, options: .CurveEaseInOut, animations: {
            UIView.performWithoutAnimation {
                let trendingColor = feedMode == .Trending ? UIColor.FLCPlainWhite() : UIColor.FLCUnselectedGray()
                self.trendingButton.setTitleColor(trendingColor, forState: .Normal)
                let newColor = feedMode == .New ?  UIColor.FLCPlainWhite() : UIColor.FLCUnselectedGray()
                self.newButton.setTitleColor(newColor, forState: .Normal)
                let likesColor = feedMode == .Liked ? UIColor.FLCPlainWhite() : UIColor.FLCUnselectedGray()
                self.likesButton.setTitleColor(likesColor, forState: .Normal)
            }
            self.layoutIfNeeded()
            }, completion: { finished in
                if UIApplication.sharedApplication().isIgnoringInteractionEvents() {
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                }
        })
        
    }
    
    func adjustConstraintsForMode(feedMode:FLVisibleFeedMode) {
        switch feedMode {
        case .New:
            removeConstraints([centerXAlignUnderlineToTrendingButton!, equalWidthUnderlineToTrendingButton,
                centerXAlignUnderlineToLikesButton!, equalWidthUnderlineToLikesButton!
                ])
            setNeedsUpdateConstraints()
            addConstraints([centerXAlignUnderlineToNewButton!,equalWidthUnderlineToNewButton!])
        case .Liked:
            removeConstraints([centerXAlignUnderlineToTrendingButton!, centerXAlignUnderlineToNewButton!, equalWidthUnderlineToTrendingButton, equalWidthUnderlineToNewButton!])
            setNeedsUpdateConstraints()
            addConstraints([centerXAlignUnderlineToLikesButton!,equalWidthUnderlineToLikesButton!])
        case .Trending:
            removeConstraints([centerXAlignUnderlineToLikesButton!, centerXAlignUnderlineToNewButton!, equalWidthUnderlineToLikesButton!, equalWidthUnderlineToNewButton!])
            setNeedsUpdateConstraints()
            addConstraints([centerXAlignUnderlineToTrendingButton!,equalWidthUnderlineToTrendingButton!])
            
        default:
            println("There was an error adjusting constraints for mode")
        }
        
    }
    
    func setupConstraints() {
        
        centerXAlignUnderlineToNewButton = NSLayoutConstraint(
            item: underlineView,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: newButton,
            attribute: .CenterX,
            multiplier: 1,
            constant: 0)
        
        equalWidthUnderlineToNewButton = NSLayoutConstraint(
            item: underlineView,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: newButton,
            attribute: .Width,
            multiplier: 1,
            constant: 0)
        
        centerXAlignUnderlineToLikesButton = NSLayoutConstraint(
            item: underlineView,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: likesButton,
            attribute: .CenterX,
            multiplier: 1,
            constant: 0)
        
        equalWidthUnderlineToLikesButton = NSLayoutConstraint(
            item: underlineView,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: likesButton,
            attribute: .Width,
            multiplier: 1,
            constant: 0)
        
    }
    

}
