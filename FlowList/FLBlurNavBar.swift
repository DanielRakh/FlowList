//
//  FLBlurNavBar.swift
//  FlowList
//
//  Created by Daniel on 1/19/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

/*
Rules for the UX:

Scroll View controls the height of the Nav Bar.
Nav Bar must always be in collapsed or expanded state.
If Nav bar is <= half of its height. It should animate automatically to collapsed mode and return the difference between that intial state and the collaped state to offset the scrollview.
Vice versa for > half of its height.

So as a user you


*/

@objc protocol FLBlurNavBarDelegate {
    
    optional func navBarExpandedBy(height:CGFloat)
    optional func navBarCollapsedBy(height:CGFloat)
    
}


enum NavBarMode {
    
    case Expanded
    case Collapsed
    case Animating
    
}

class FLBlurNavBar: UIVisualEffectView {
    
    //MARK:
    //MARK: Properties
    
    @IBOutlet weak var vibrancyEffectView:UIVisualEffectView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var feedHeaderView:FLFeedHeaderView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var delegate:FLBlurNavBarDelegate?
    
    private let kAnimationDragValueMultiplier:CGFloat = 0.9
    let expandedHeight:CGFloat = 118.0
    let collapsedHeight:CGFloat = 20.0
    
    var mode:NavBarMode = .Expanded
    
    //MARK:
    //MARK: View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK:
    // MARK: Setup
    
    func setupUI() {
        
        backgroundColor = UIColor.clearColor()
        contentView.backgroundColor = UIColor.clearColor()
        vibrancyEffectView.contentView.backgroundColor = UIColor.FLCHazyBlue()
        setupTitle()
    }
    
    
    func setupTitle() {
        
        let attrString = NSAttributedString(
            string: "</FLOWLIST>",
            attributes:
            [NSForegroundColorAttributeName: UIColor.FLCElectricBlue(),
                NSKernAttributeName: 2,
                NSFontAttributeName: UIFont(name:"AvenirNext-DemiBold", size: CGFloat(20))!] as NSDictionary)
        titleLabel.attributedText = attrString
        titleLabel.sizeToFit()
    }
    
    func transitionToHeight(height:CGFloat, shouldAnimate:Bool, completion:(success:Bool) -> Void) {
        
        heightConstraint.constant = height
        
        let subViewAnimatedValue = (height - 18) / 100
        
        UIView.animateWithDuration(shouldAnimate == true ? 0.35 : 0.1,
            animations: { () -> Void in
                self.titleLabel.alpha = subViewAnimatedValue
                self.feedHeaderView.alpha = subViewAnimatedValue
                self.titleLabel.transform = CGAffineTransformMakeScale(subViewAnimatedValue, subViewAnimatedValue)
                self.layoutIfNeeded()
            }) { (success:Bool) -> Void in
                
                switch self.heightConstraint.constant {
                    
                case self.expandedHeight:
                    self.mode = .Expanded
                case self.collapsedHeight:
                    self.mode = .Collapsed
                default:
                    self.mode = .Animating
                }

                
                
                completion(success: true)
        }
        

    }
    
    func expandWithValue(value:CGFloat) {
        
        let initialHeight = heightConstraint.constant
        let height = ((initialHeight + (value * kAnimationDragValueMultiplier)) > expandedHeight) ? expandedHeight: initialHeight + (value * kAnimationDragValueMultiplier)
        transitionToHeight(height, shouldAnimate: false) { success in
           //
        }
        
    }
    
    func collapseWithValue(value:CGFloat) {
        
        let initialHeight = heightConstraint.constant
        let height = ((initialHeight - (value * kAnimationDragValueMultiplier)) <= collapsedHeight) ? collapsedHeight : initialHeight - (value * kAnimationDragValueMultiplier)
        transitionToHeight(height, shouldAnimate: false) { success in
            //
        }
    }
    
    func fullyExpand() {
        
        let initialHeight = heightConstraint.constant
        transitionToHeight(expandedHeight, shouldAnimate: true) { success in
            self.delegate?.navBarExpandedBy?(self.expandedHeight - initialHeight)
            return
        }
    }
    
    func fullyCollapse() {
        let initialHeight = heightConstraint.constant
        transitionToHeight(collapsedHeight, shouldAnimate: true) { success in
            self.delegate?.navBarCollapsedBy?(self.collapsedHeight - initialHeight)
            return
        }
    }
    
    
    //    func prepareHeightForValue(value:CGFloat, forMode mode:NavBarMode) -> CGFloat? {
    //
    //        let initialHeight = heightConstraint.constant
    //        let height:CGFloat?
    //
    //        if mode == .Expanded {
    //            height = ((initialHeight + (value * kAnimationDragValueMultiplier)) > expandedHeight) ? expandedHeight: initialHeight + (value * kAnimationDragValueMultiplier)
    //
    //        } else if mode == .Collapsed {
    //             height = ((initialHeight - (value * kAnimationDragValueMultiplier)) <= collapsedHeight) ? collapsedHeight : initialHeight - (value * kAnimationDragValueMultiplier)
    //        }
    //
    //        return height
    //    }
    //
    
}
    