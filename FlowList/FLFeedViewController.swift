//
//  FLFeedViewController.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedViewController: UIViewController {
    
    //MARK:
    //MARK: Properties
    
    //MARK: Public
    var eventHandler:FLFeedPresenter?
    
    //MARK: Private
    private let cellIdentifier = "FeedCell"
    private var songs:[FLSongItem]?

    //MARK: IBOutlets
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var tableViewHeader: UIView!
    
    
    //MARK:
    //MARK: Methods
    
    //MARK: Initial Helpers
    
    func initialSetup() {
        tableView.dataSource = self
        tableView.delegate = self
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = UIColor.FLCMightnightBlue()
        tableViewHeader.frame = CGRectMake(0, 0, tableView.bounds.size.width, 54)
        tableView.tableHeaderView = tableViewHeader
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.backgroundColor = UIColor.clearColor()
    }
    
    
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println(self.tableView.tableHeaderView)
    }
    
    
    //MARK: Helpers
    
    @IBAction func hitAPI(sender: AnyObject) {
        eventHandler?.initialSetup()

    }
}


//MARK:
//MARK: Extensions

//MARK: Feed View Input
extension FLFeedViewController: FLFeedViewInput {
    
    func showSongs(songs:[FLSongItem]) {
        self.songs = songs
        tableView.reloadData()
    }
}

//MARK: Table View Data Source
extension FLFeedViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let songs = self.songs {
            return songs.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as FLFeedTableCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.FLCHazyBlue() : UIColor.FLCMightnightBlue()
        cell.layoutMargins = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        setupCellForSong(cell, song: songs![indexPath.row])
        return cell
    }
    
    func setupCellForSong(cell:FLFeedTableCell, song:FLSongItem) {
        cell.creatorLabel.text = song.username
        cell.titleLabel.text = song.title
    }
    
}

//MARK: Table View Delegate
extension FLFeedViewController: UITableViewDelegate {
}



