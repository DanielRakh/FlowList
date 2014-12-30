//
//  FLNetworkService.swift
//  FlowList
//
//  Created by Daniel on 12/28/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation
import Alamofire



class FLFeedNetworkService {
    private let searchParam = "search"
    private let queryParam = "query"
    private let apiURL = "http://flowlist.io/"
    
    
    func fetchDataForQuery(query:String, onFailure fail:(NSError -> Void)? = nil, onSuccess succeed:(AnyObject -> Void)? = nil) {
        
        if fail == nil && succeed == nil { return }
        
        let parameters = [searchParam : [queryParam : query]]
        
        Alamofire.request(.POST, apiURL + searchParam, parameters: parameters).responseJSON { (request, response, json , error) in
            if error != nil {
                if let didFail = fail {
                    didFail(error!)
                }
            } else {
                assert(json != nil, "There must be some JSON returned if there is no error.")
                if json != nil {
                    if let didSucceed = succeed {
                        didSucceed(json!)
                    }
                }
            }
        }
    }
    
    
    
}
