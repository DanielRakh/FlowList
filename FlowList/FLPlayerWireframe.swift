//
//  FLPlayerWireframe.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLPlayerWireframe: NSObject {
    
    var playerPresenter: FLPlayerPresenter?
    
    func setupPlayerInterfaceFromViewController(viewController:FLPlayerViewController) {
        viewController.eventHandler = playerPresenter
        playerPresenter!.userInterface = viewController
    }
    
}
