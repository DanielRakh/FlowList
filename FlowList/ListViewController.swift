//
//  ListViewController.swift
//  FlowList
//
//  Created by Daniel on 12/26/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    let cellIdentifier = "Cell"
    
    var eventHandler:ListPresenterInterface?
    
    var displayData:[String]?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        eventHandler?.updateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


extension ListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let itemsArray = displayData {
            return itemsArray.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        if let itemsArray = displayData {
            cell.textLabel?.text = itemsArray[indexPath.row] as String
        }
        return cell
    }
    
}


extension ListViewController: UITableViewDelegate {
    
    
}


extension ListViewController:ListViewInterface {
    
    func showTrendingDisplayData(songs:[String]) {
        displayData = songs
        self.tableView.reloadData()
    }
}


