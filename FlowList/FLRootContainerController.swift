//
//  FLRootContainerController.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLRootContainerController: UIViewController {
    
    var eventHandler:FLRootContainerPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    func setupNavigationBar() {
        
        let titleLabel = UILabel()
        
        let attrString = NSAttributedString(
            string: "</FLOWLIST>",
            attributes:
            [NSForegroundColorAttributeName: UIColor.FLCElectricBlue(),
                NSKernAttributeName: 2,
                NSFontAttributeName: UIFont(name:"AvenirNext-DemiBold", size: CGFloat(20))!] as NSDictionary)
        titleLabel.attributedText = attrString
        titleLabel.sizeToFit()
        navigationItem.titleView = titleLabel
        
        createTestBarButton()
        
        
    }
    
    func createTestBarButton() {
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("hitApi"))
        navigationItem.rightBarButtonItem = addItem
    }


    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "presentFeedController" {
            eventHandler?.setupFeedModuleForViewController(segue.destinationViewController as FLFeedViewController)
        } else if segue.identifier == "presentPlayerController" {
            eventHandler?.setupPlayerModuleForViewController(segue.destinationViewController as FLPlayerViewController)
        }
    }

}


extension FLRootContainerController : FLRootContainerViewInput {
    
}
