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

   func fetchDataForQuery(query:String, completion:(response:AnyObject?, error:NSError?) -> Void) {
        
        let parameters = ["search" : ["query" : query]]
        
        Alamofire.request(.POST, "http://flowlist.io/search", parameters: parameters).responseJSON { (request, response, json , error) in
            completion(response: json, error: error)
        }
    }
    
    
 
    

}
