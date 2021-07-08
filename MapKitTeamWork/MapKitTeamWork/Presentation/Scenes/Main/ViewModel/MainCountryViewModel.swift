//
//  MainCountryViewModel.swift
//  main
//
//  Created by Ilia Tsikelashvili on 07.07.21.
//

import Foundation
struct MainCountryViewModel {
    
    private var country: CountryModel
    
    init(country: CountryModel) {
        self.country = country
    }
    
    var name: String {
        country.country ?? ""
    }
    
}
