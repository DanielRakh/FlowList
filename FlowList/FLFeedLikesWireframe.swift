//
//  FLFeedLikesWireframe.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedLikesWireframe: NSObject {
    
    var likesPresenter: FLFeedLikesPresenter?
    
    func setupLikesFeedInterfaceFromViewController(viewController:FLFeedLikesTableViewController) {
        viewController.eventHandler = likesPresenter
    }
   
}
