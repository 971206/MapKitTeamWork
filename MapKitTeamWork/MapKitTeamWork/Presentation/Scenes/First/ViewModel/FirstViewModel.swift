//
//  CountryViewModel.swift
//  MapKitTeamWork
//
//  Created by Mac User on 07.06.21.
//


import Foundation

struct FirstViewModel {
    
    private var country: CountryModel
    
    init(country: CountryModel) {
        self.country = country
    }
    
    var name: String {
        country.country ?? ""
    }
    
    
    var capital: String {
        country.capital ?? ""
    }
    
    var coordinated: String {
        "Lat: \((country.coordinates ?? [])[0]) Lng: \((country.coordinates ?? [])[1])"
        
    }
    
}
