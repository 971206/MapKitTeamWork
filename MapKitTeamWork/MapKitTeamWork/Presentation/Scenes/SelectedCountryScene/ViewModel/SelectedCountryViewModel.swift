//
//  SelectedCountryViewModel.swift
//  MapKitTeamWork
//
//  Created by Nana Jimsheleishvili on 07.07.21.
//

import Foundation


protocol SelectedCountryViewModelProtocol{
    
    func fetchCountries(completion: @escaping((Result<[CountryModel], Error>) -> Void))
    
    var controller: CoordinatorDelegate { get }
    
    init(controller: CoordinatorDelegate)
}

final class SelectedCountryViewModel: SelectedCountryViewModelProtocol{
    
    private(set) var controller: CoordinatorDelegate
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }

    func fetchCountries(completion: @escaping((Result<[CountryModel], Error>) -> Void)) {
        controller.coordinator?.countryManager.fetchInfo(completion: completion)
    }
}
