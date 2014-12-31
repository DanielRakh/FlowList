//
//  FLFeedViewController.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedViewController: UIViewController {
    
    let cellIdentifier = "FeedCell"
    
    var eventHandler:FLFeedPresenter?
    var songs:[FLSongItem]?
    
    @IBOutlet var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "</FLOWLIST>"
        view.backgroundColor = UIColor.FLCMightnightBlue()
        tableView.dataSource = self
        tableView.delegate = self
        createTestBarButton()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    func hitApi() {
        eventHandler?.initialSetup()
    }
    
    func createTestBarButton() {
    
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("hitApi"))
        
        navigationItem.rightBarButtonItem = addItem
    }
    
    
}


extension FLFeedViewController: FLFeedViewInput {
    
    func showSongs(songs:[FLSongItem]) {
        self.songs = songs
        tableView.reloadData()
    }
}


extension FLFeedViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let songs = self.songs {
            return songs.count
        } else {
            return 0
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        cell.backgroundColor = UIColor.FLCHazyBlue()
        return cell
    }
    
}

extension FLFeedViewController: UITableViewDelegate {
}



