//
//  ServerAPIHandler.swift
//  XInfinityTest
//
//  Created by Victor Martin on 7/11/18.
//  Copyright © 2018 Victor Martin. All rights reserved.
//

import Foundation
import Alamofire

typealias contactArrayHandler = ([Contact], Error?) -> Void

private final class ServerAPIHandler{
    private init(){}
    static let shared = ServerAPIHandler()
    
    private func fetchData(path: String, completion: @escaping contactArrayHandler){
        guard let url = getUrl(path: path) else{
            completion([], NSError())
            return
        }
        
        let request = Alamofire.request(url)
        request.responseJSON { (response) in
            guard let json  = response.data as? [String: Any] else{
                return
            }
            print(json["result"])
            print(json)
        }
   
    }
    
    private func getUrl(path: String) -> URL?{
        return URL(string: path)
    }
}
