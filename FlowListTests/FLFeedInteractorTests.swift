//
//  FlowListTests.swift
//  FlowListTests
//
//  Created by Daniel on 12/20/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit
import XCTest

class FeedInteractorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testThatInteractorCanFindAllSongs() {
        
        var mockSongs = [FLSongItem]()
        for i in 1...10 {
            let song = FLSongItem(title: "", creator: "", urlString: "", secondsDuration: 1000.0)
            mockSongs += [song]
            }
        
        let interactor = FLFeedInteractor()
        let songs = interactor.findAllSongs()
        
        XCTAssertEqual(songs, mockSongs, "Should be equal")
    }
    
    
}
