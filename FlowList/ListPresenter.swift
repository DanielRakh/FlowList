//
//  ListPresenter.swift
//  FlowList
//
//  Created by Daniel on 12/26/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class ListPresenter: NSObject {
    
    var userInterface:ListViewInterface?
    var listInteractor: ListInteractorInput?
    var listWireframe: ListWireframe?
   
    func updateUserInterfaceWithTrendingSongs(songs:[TrendingSongItem]) {
        let songTitles = songs.map({ song in
        (song as TrendingSongItem).songTitle})
        userInterface?.showTrendingDisplayData(songTitles)
    }
}


extension ListPresenter: ListInteractorOutput {
    
    func foundTrendingSongs(songs:[TrendingSongItem]) {
        
        updateUserInterfaceWithTrendingSongs(songs)
    }
    
}

extension ListPresenter: ListPresenterInterface {
    func updateView() {
        listInteractor?.findTrendingSongs()
    }
}