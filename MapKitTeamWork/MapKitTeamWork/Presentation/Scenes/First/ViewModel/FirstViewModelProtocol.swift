//
//  CountriesListViewModel.swift
//  MapKitTeamWork
//
//  Created by Mac User on 07.06.21.
//


import UIKit

protocol FirstViewModelProtocol: AnyObject {
    func getCountriesList(completion: @escaping (([FirstViewModel]) -> Void))
    
    var didFinishedLoading: (() -> Void)? { get set }
    
    init(with countriesManager: CountryManagerProtocol)
}

class FirstListViewModel: FirstViewModelProtocol {
    
    // MARK: - Private properties
    
    private var countriesManager: CountryManagerProtocol!
    
    // MARK: - Outputs
    
    var didFinishedLoading: (() -> Void)?
            
    required init(with countriesManager: CountryManagerProtocol)  {
        self.countriesManager = countriesManager
    }
    
    func getCountriesList(completion: @escaping (([FirstViewModel]) -> Void)) {
        countriesManager.fetchInfo{ countries in
            switch countries {
            case .success(_):
                DispatchQueue.main.async {
                    let countriesViewModels = countries.map { FirstViewModel(country: $0) }
                    print(countriesViewModels)
                    completion(countriesViewModels)

                }
            case .failure(_):
                print("Error")

            }
            
    }
    
 }
}
