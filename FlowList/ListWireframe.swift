//
//  ListWireframe.swift
//  FlowList
//
//  Created by Daniel on 12/26/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

let ListViewControllerIdentifier = "ListViewController"

class ListWireframe: NSObject {
    
    var rootWireframe: RootWireframe?
    var listViewController: ListViewController?
   
    func presentListInterfaceFromWindow(window:UIWindow) {
        let viewController = listViewControllerFromStoryboard()
        //TODO:Attach Presenter to .eventHandler of viewController(View)
        //TODO:Attach viewController(View) to .userInterface of Presenter
        rootWireframe?.showRootViewController(viewController, inWindow: window)
    }
    
    
    func listViewControllerFromStoryboard() -> ListViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(ListViewControllerIdentifier) as ListViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }

}
