//
//  FLTableViewManager.swift
//  FlowList
//
//  Created by Daniel on 12/20/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLTableViewManager: NSObject {
    
    private let cellIdentifier = "TrackCell"
    private var tableView:UITableView
    private var items:[Int]!
    
    
    required init(tableView:UITableView) {
        items = Array(1...4)
        self.tableView = tableView
        tableView.tableFooterView = UIView(frame: CGRectZero)
        super.init()
        tableView.dataSource = self
    }
    
    func configureCell(cell:FLTrackCell, forIndexPath indexPath:NSIndexPath) {
        cell.textLabel!.text = "\(indexPath.row)"
    }
}

extension FLTableViewManager: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as FLTrackCell
                        configureCell(cell, forIndexPath: indexPath)
        return cell
    }
    
}
