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
        let listPresenter = ListPresenter()
        let listDataManager = ListDataManager()
        let listInteractor = ListInteractor(dataManager: listDataManager)
        
        listInteractor.output = listPresenter
        listPresenter.listInteractor = listInteractor
        listPresenter.listWireframe = listWireframe
        
        listWireframe.listPresenter = listPresenter
        listWireframe.rootWireframe = rootWireframe
        

        
        listWireframe.rootWireframe  = rootWireframe

    }
    
}