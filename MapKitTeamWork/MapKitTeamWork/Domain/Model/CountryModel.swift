//
//  CountryModel.swift
//  ThreeTeamWork
//
//  Created by Nana Jimsheleishvili on 07.07.21.
//

import Foundation

struct CountryModel: Codable{
    var country: String?
    var capital: String?
    var coordinates: [Double]?
    
    enum CodingKeys: String, CodingKey {
        case coordinates = "latlng"
        case country = "name"
        case capital = "capital"
    }
}
