//
//  SongItemTests.swift
//  FlowList
//
//  Created by Daniel on 12/28/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation
import XCTest

class FLSongItemTests: XCTestCase {

    var songItem:FLSongItem?
    
    override func setUp() {
        super.setUp()
        
        songItem = FLSongItem(title: "Title", creator: "Creator", streamURL: "www.flowlist.io", milliSecondsDuration: 100000, soundcloudId: 12345)
    }
    
    func testThatSongItemHasATitle() {
        XCTAssertEqual(songItem!.title, "Title", "Song Item must have a title")
    }
    
    func testThatSongItemHasACreator() {
        XCTAssertEqual(songItem!.creator, "Creator", "Song Item must have a creator")
    }
    
    func testThatSongItemHasAurlString() {
        XCTAssertEqual(songItem!.streamURL, "www.flowlist.io", "Song Item must have a url string")
    }
    
    func testThatSongItemHasASecondsDuration() {
        XCTAssertEqual(songItem!.milliSecondsDuration, 100000, "Song Item must have a duration in seconds")
    }
    
    func testThatSongItemHasASoundcloudID() {
        XCTAssertEqual(songItem!.soundcloudId, 12345, "Song Item must have a soundcloud ID")
    }


}
