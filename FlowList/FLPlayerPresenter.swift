//
//  FLPlayerPresenter.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLPlayerPresenter: NSObject {

    var userInterface:FLPlayerViewInput?
    var playerInteractor:FLPlayerInteractor?
    var playerWireframe:FLPlayerWireframe?
}

extension FLPlayerPresenter:FLPlayerViewOutput {
}


extension FLPlayerPresenter: FLPlayerInteractorOutput {
}
