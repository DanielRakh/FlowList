//
//  FLRootContainerPresenter.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLRootContainerPresenter: NSObject {
    
    var rootWireframe:FLRootWireframe?
    var userInterface:FLRootContainerViewInput?

    
    func setupFeedModuleForViewController(viewController:FLFeedRootViewController) {
        rootWireframe?.setupFeedInterfaceFromViewController(viewController)
    }
    
    func setupPlayerModuleForViewController(viewController:FLPlayerViewController) {
        rootWireframe?.setupPlayerInterfaceFromViewController(viewController)
        
    }
   
}


extension FLRootContainerPresenter:FLRootContainerViewOutput {
    
}
