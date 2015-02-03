//
//  FLFeedNewTableViewController.swift
//  FlowList
//
//  Created by Daniel on 1/9/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedNewTableViewController: UITableViewController {

    
    //MARK:
    //MARK: Properties
    
    //MARK: Public
    var eventHandler:FLFeedNewPresenter! {
        didSet {
            eventHandler!.userInterface = self
        }
    }
    
    //MARK: Private
    
    private let cellIdentifier = "FeedCell"
    private var songs:[FLSongItem]?
    
    
    
    //MARK:
    //MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        eventHandler?.initialSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.contentInset = UIEdgeInsetsMake(118, 0, 70, 0)
    }
    
    func setupViews() {
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.backgroundColor = UIColor.clearColor()
        
    }
}


//MARK:
//MARK: Extensions

//MARK: Table View Data Source
extension FLFeedNewTableViewController: UITableViewDataSource {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let songs = self.songs {
            return songs.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as FLFeedTableCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.FLCHazyBlue() : UIColor.FLCMightnightBlue()
        cell.layoutMargins = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        setupCellForSong(cell, song: songs![indexPath.row])
        return cell
    }
    
    func setupCellForSong(cell:FLFeedTableCell, song:FLSongItem) {
        cell.creatorLabel.text = song.creator
        cell.titleLabel.text = song.title
    }
    
}

//MARK: Table View Delegate
extension FLFeedNewTableViewController: UITableViewDelegate {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Table View Did Select row")
    }
}


//MARK: Feed View Input
extension FLFeedNewTableViewController: FLFeedNewViewInput {
    
    func showSongs(songs:[FLSongItem]) {
        self.songs = songs
        tableView.reloadData()
    }

}



