//
//  FLFeedNewWireframe.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedNewWireframe: NSObject {
    
    var newPresenter: FLFeedNewPresenter?
    
    func setupNewFeedInterfaceFromViewController(viewController:FLFeedNewTableViewController) {
        viewController.eventHandler = newPresenter
    }
    
   
}
