//
//  FLTrendingScrollViewDelegate.swift
//  FlowList
//
//  Created by Daniel on 1/26/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import Foundation


protocol FLTrendingScrollViewDelegate {
    
    func userDidScrollDirection(direction:ScrollDirection, dragValue:Float)
    func scrollViewWillEndDragging(direction:ScrollDirection)
    func scrollViewWillBeginDragging()
    func userWillEndDraggingWeakly(direction withDirection:ScrollDirection?)
}


