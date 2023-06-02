//
//  DataModel.swift
//  Covid 2
//
//  Created by Yogesh Tekwani on 6/1/23.
//

import Foundation

struct AllData : Codable{
    var country: String?
    var details: [Details]?
    //var everything: [String:[Details]]
}

struct Details: Codable {
//    var date: [String? : String?]
//    var confirmed: [String? : Int?]
//    var deaths: [String? : Int?]
//    var recovered: [String? : Int?]
    var date: String?
    var confirmed: Int?
    var deaths: Int?
    var recovered: Int?
    
}


