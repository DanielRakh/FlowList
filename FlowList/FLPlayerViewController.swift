//
//  FLPlayerViewController.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLPlayerViewController: UIViewController {

    var eventHandler:FLPlayerPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.FLCHazyBlue()
        // Do any additional setup after loading the view.
    }

}


extension FLPlayerViewController: FLPlayerViewInput {
    
}