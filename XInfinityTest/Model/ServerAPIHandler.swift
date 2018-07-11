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

public final class ServerAPIHandler{
    private init(){}
    static let shared = ServerAPIHandler()
    
    func fetchData(path: String, completion: @escaping contactArrayHandler){
        guard let url = getUrl(path: path) else{
            completion([], NSError())
            return
        }
        
        let request = Alamofire.request(url)
        request.response { (res) in
            guard let data = res.data else{
                return
            }
            let json = self.parseJson(json: data)
            let contacts = self.parseContactJsonToContact(json: json)
        }
   
    }
    
    private func parseContactJsonToContact(json: [ContactJson]) -> [Contact]{
        var res: [Contact] = []
        
        for item in json{
            let info = parseTextString(str: item.Text)
            res.append(Contact(title: info.0, icon: item.Icon.URL, description: info.1))
        }
        
        return res
    }
    
    private func parseTextString(str: String) -> (String, String){
        return ("", "")
    }
    
    private func parseJson(json: Data) -> [ContactJson]{
        var res: [ContactJson] = []
        
        do{
            let decodedData = try JSONDecoder().decode(ContactResponseJSON.self, from: json)
            res = decodedData.RelatedTopics
        }catch{
            print(error)
        }
        
        return res
    }
    
    private func getUrl(path: String) -> URL?{
        return URL(string: path)
    }
}
