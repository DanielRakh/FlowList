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
    
    enum SongRouter: URLRequestConvertible, Printable {
        
        private static let baseURLString = "http://flowlist.io"
        
        case New(String, Int)
        case Trending(String, Int)
        case Liked(String, Int)
        
        var URLRequest: NSURLRequest {
            let (path:String, parameters: [String: AnyObject]) = {
                switch self {
                    
                case New(let query, let count):
                    let params = ["query": query]
                    return("/search/",params)
                    
                case Trending(let query, let count):
                    let params = ["query": query]
                    return("/search/",params)
                    
                case Liked(let query, let count):
                    let params = ["query": query]
                    return("/search/",params)
                }
                
            }()
            
            let URL = NSURL(string: SongRouter.baseURLString)
            let URLRequest = NSURLRequest(URL: URL!.URLByAppendingPathComponent(path))
            let encoding = Alamofire.ParameterEncoding.URL
            
            return encoding.encode(URLRequest, parameters: parameters).0
            
        }
        
        var description: String {
            return self.URLRequest.description
        }

    }
    
    private let searchParam = "search"
    private let queryParam = "query"
    private let apiURL = "http://flowlist.io/"
    
    func fetchDataForQuery(query:String, onFailure fail:(NSError -> Void)? = nil, onSuccess succeed:(AnyObject -> Void)? = nil) {
        
        if fail == nil && succeed == nil { return }
        
        let parameters = [searchParam : [queryParam : query]]
        
        Alamofire.request(.POST, apiURL + searchParam, parameters: parameters).responseJSON { (request, response, json , error) in
            println((request as NSURLRequest).allHTTPHeaderFields)
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
