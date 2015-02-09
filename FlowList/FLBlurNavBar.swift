//
//  FLBlurNavBar.swift
//  FlowList
//
//  Created by Daniel on 1/19/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit


@objc protocol FLBlurNavBarDelegate {
    
    optional func navBarExpandedBy(height:CGFloat)
    optional func navBarCollapsedBy(height:CGFloat)
    
}

// var description : String {
//    switch self {
//    case .Expanded: return "Expanded";
//    case .Collapsed: return "Collapsed";
//    case .Transitioning(false): return "Not Transitioning";
//    case .Transitioning(true): return "Transitioning";
//        
//    }
//    
//}

class FLBlurNavBar: UIVisualEffectView {
    
    //MARK:
    //MARK: Properties
    
    @IBOutlet weak var vibrancyEffectView:UIVisualEffectView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var feedHeaderView:FLFeedHeaderView!
    @IBOutlet weak var hairlineView:FLHairlineView!
    
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var delegate:FLBlurNavBarDelegate?
    
    private let kAnimationDragValueMultiplier:CGFloat = 0.9
    let expandedHeight:CGFloat = 118.0
    let collapsedHeight:CGFloat = 20.0
    
    var mode:FLNavBarMode = .Expanded
    var transitioning:Bool = false

    
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
            delay:0.0,
            options:UIViewAnimationOptions.BeginFromCurrentState,
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
                    self.mode = .Transitioning
             
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
    
    func fullyExpand(shouldAnimate:Bool, shouldCallDelegate:Bool) {
        println("fully expand")

        if self.mode != .Expanded  {
            let initialHeight = heightConstraint.constant
            if shouldCallDelegate {
                self.delegate?.navBarExpandedBy?(self.expandedHeight - initialHeight)
   
            }
            transitionToHeight(expandedHeight, shouldAnimate: shouldAnimate) { success in
            }
        }
     
    }
    
    func fullyCollapse(shouldAnimate:Bool, shouldCallDelegate:Bool) {
        println("fully collapse")
        if self.mode != .Collapsed {
            let initialHeight = heightConstraint.constant
            if shouldCallDelegate {
                self.delegate?.navBarCollapsedBy?(self.collapsedHeight - initialHeight)
            }
            transitionToHeight(collapsedHeight, shouldAnimate: shouldAnimate) { success in
            }
        }
      
    }
    
    
}
    