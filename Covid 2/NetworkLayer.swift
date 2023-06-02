//
//  NetworkLayer.swift
//  Covid 2
//
//  Created by Yogesh Tekwani on 6/1/23.
//

import Foundation

func reqData(completionHandler: @escaping ([String : [Details]]?) -> ()){
    
    var all : [String : [Details]]?
    
    let url = URL(string: "https://pomber.github.io/covid19/timeseries.json")
    
   let reqUrl = URLRequest(url: url!)
    
    let task = URLSession.shared.dataTask(with: reqUrl) { data, response, error in
        if error != nil {
            print("In Error")
            print(error?.localizedDescription)
            completionHandler(nil)
            return
        }
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("In Response Error")
            print(error)
            completionHandler(nil)
            return
        }
        
        if let temp = String(data: data!, encoding: .utf8){
            print(temp.count)
        }
        
        if let data = data {
            print("Inside Data")
            
            do{
                let decoder = JSONDecoder()
                let alld = try decoder.decode([String : [Details]].self, from: data)
                all = alld
                completionHandler(all)
            }catch{
                print("Data Error")
                print(error)
                print(error.localizedDescription)
                completionHandler(nil)
            }
        }
    }
    task.resume()
}
