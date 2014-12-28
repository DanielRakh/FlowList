//
//  FLFeedController.swift
//  FlowList
//
//  Created by Daniel on 12/20/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedController: UIViewController {

    //MARK:
    //MARK:Properties
    
    
    //MARK:IBOutlets
    @IBOutlet weak var tableView: FLTableView!
    
    
    //MARK: Public
    var tableViewManager:FLTableViewManager!
    
    //MARK: Private
    
    
    //MARK:
    //MARK:Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableViewManager = FLTableViewManager(tableView: tableView)
    }


}
