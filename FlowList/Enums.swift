//
//  Enums.swift
//  FlowList
//
//  Created by Daniel on 2/9/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//


// ** A collection of all of the global enums ** //


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


/**

The current visible state of FLNavBar


- Expanded:      Fully expanded

- Collapsed:     Fully collapsed

- Transitioning: In mid animation to either be expanded or collapsed.

*/

enum FLNavBarMode {
    case Expanded
    case Collapsed
    case Transitioning
}

