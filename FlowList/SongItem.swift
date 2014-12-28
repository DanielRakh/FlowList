//
//  SongItem.swift
//  FlowList
//
//  Created by Daniel on 12/28/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation

struct SongItem {
    
    let title:String
    let creator:String
    let urlString:String
    let secondsDuration:Double

    init(title:String, creator:String, urlString:String, secondsDuration:Double) {
        self.title = title
        self.creator = creator
        self.urlString = urlString
        self.secondsDuration = secondsDuration
    }
}
