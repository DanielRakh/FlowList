//
//  AppDependencies.swift
//  FlowList
//
//  Created by Daniel on 12/26/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class AppDependencies {
    
    var listWireframe = ListWireframe()
    
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(window:UIWindow) {
        listWireframe.presentListInterfaceFromWindow(window)
    }
    
    func configureDependencies() {
        
        let rootWireframe = RootWireframe()
        
        listWireframe.rootWireframe  = rootWireframe

    }
    
}