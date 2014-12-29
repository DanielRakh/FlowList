//
//  FLNetworkService.swift
//  FlowList
//
//  Created by Daniel on 12/28/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation
import Alamofire

protocol FLFeedNetworkServiceDelegate {
    
}


class FLFeedNetworkService {
        
    func fetchDataForQuery(query:String) {
        
        let parameters = ["search" : ["query" : query]]
        
        Alamofire.request(.POST, "http//flowlist.io/search", parameters: parameters).responseJSON {
            (request:NSURLRequest, response:NSHTTPURLResponse?, json:AnyObject?, error:NSError?) -> Void in
            //
        }
    }
}
