//
//  Enums.swift
//  FlowList
//
//  Created by Daniel on 2/9/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//


//MARK: This is a collection of all of the global enums used fully documented.



/**

The direction of scroll for any feed

- Up:   The user is scrolling up by dragging down.

- Down: The user is scrolling down by dragging up.

*/

enum ScrollDirection {
    case Up
    case Down
}



/**

The current visible feed


- New:      New Feed

- Trending: Trending Feed

- Liked:    Liked Feed

*/

enum FLVisibleFeedMode {
    case New
    case Trending
    case Liked
}
