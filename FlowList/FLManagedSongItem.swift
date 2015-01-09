//
//  FLManagedSongItem.swift
//  FlowList
//
//  Created by Daniel on 1/9/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import Foundation
import CoreData

class FLManagedSongItem: NSManagedObject {

    @NSManaged var soundCloudID: String
    @NSManaged var milliSecondsDuration: NSNumber
    @NSManaged var streamURL: String
    @NSManaged var creator: String
    @NSManaged var title: String

}
