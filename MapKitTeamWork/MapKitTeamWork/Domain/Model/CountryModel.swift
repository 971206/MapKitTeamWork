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
    
    enum CodingKeys: String, CodingKey {
        case country = "name"
        case capital = "capital"
    }
}
