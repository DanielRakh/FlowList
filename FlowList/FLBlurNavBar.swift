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
    let expandedHeight:CGFloat = 110.0
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
    
    func transitionToMode(mode:FLNavBarMode, value:CGFloat, shouldAnimate:Bool, completion:(success:Bool) -> Void) {
        
        var height:CGFloat!
        
        if mode == .Expanded {
            height = heightConstraint.constant + value >= expandedHeight ? expandedHeight : heightConstraint.constant + value
        } else if mode == .Collapsed {
            
            height = heightConstraint.constant - value <= collapsedHeight ? collapsedHeight : heightConstraint.constant - value
        }
        
        heightConstraint.constant = height

        let subViewAnimatedValue = mode == .Expanded ? value / expandedHeight : -(value / expandedHeight)
        
        UIView.animateWithDuration(shouldAnimate == true ? 0.35 : 0,
            delay:0.0,
            options:UIViewAnimationOptions.BeginFromCurrentState,
            animations: { () -> Void in
                
                if shouldAnimate {
                    self.titleLabel.alpha = mode == .Expanded ? 1.0 : 0.0
                    self.feedHeaderView.alpha = mode == .Expanded ? 1.0 : 0.0
                    self.hairlineView.alpha = mode == .Expanded ? 1.0 : 0.0
                    
                } else {
                    self.titleLabel.alpha += subViewAnimatedValue * 5
                    self.feedHeaderView.alpha += subViewAnimatedValue * 2
                    self.hairlineView.alpha += subViewAnimatedValue * 2
                }
             
                //self.titleLabel.transform = CGAffineTransformMakeScale(self.titleLabel.alpha, self.titleLabel.alpha)
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
        transitionToMode(.Expanded, value:value, shouldAnimate: false) { success in
            //
        }
    }
    
    func collapseWithValue(value:CGFloat) {
        transitionToMode(.Collapsed, value:value, shouldAnimate: false) { success in
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
            transitionToMode(.Expanded, value: expandedHeight, shouldAnimate: true, completion: { success in
                //
            })
            
            }
    }

    func fullyCollapse(shouldAnimate:Bool, shouldCallDelegate:Bool) {
        println("fully collapse")
        if self.mode != .Collapsed {
            let initialHeight = heightConstraint.constant
            if shouldCallDelegate {
                self.delegate?.navBarCollapsedBy?(self.collapsedHeight - initialHeight)
            }
            transitionToMode(.Collapsed, value: collapsedHeight, shouldAnimate: true, completion: { success in
                //
            })
        }
      
    }
    
}
    