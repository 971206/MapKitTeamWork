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
    
    private var countryManager: CountryManagerProtocol!
    
    // MARK: - Outputs
    
    var didFinishedLoading: (() -> Void)?
    
    required init(with manager: CountryManagerProtocol)  {
        self.countryManager = manager
    }
    
    func getCountriesList(completion: @escaping (([FirstViewModel]) -> Void)) {
        countryManager.fetchInfo { result  in
            switch result {
            case .failure(let err):
                print("Failed: \(err)")
            case .success(let v):
                DispatchQueue.main.async {
                    self.countryManager = v.map{ $0 } 

                }
            }
        }
    }
}
