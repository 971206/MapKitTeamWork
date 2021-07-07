//
//  CountriesListViewModel.swift
//  27AniMekvabidze
//
//  Created by Mac User on 07.06.21.
//

import UIKit

protocol RegisterViewModelProtocol: AnyObject {
    func getCountriesList(completion: @escaping (([RegisterViewModel]) -> Void))
    
    var didFinishedLoading: (() -> Void)? { get set }
    
    init(with countriesManager: CountryManagerProtocol)
}

class RegisterListViewModel: RegisterViewModelProtocol {
    
    // MARK: - Private properties
    
    private var countriesManager: CountryManagerProtocol!
    
    // MARK: - Outputs
    
    var didFinishedLoading: (() -> Void)?
            
    required init(with countriesManager: CountryManagerProtocol)  {
        self.countriesManager = countriesManager
    }
    
    func getCountriesList(completion: @escaping (([RegisterViewModel]) -> Void)) {
        countriesManager.fetchInfo{ countries in
            DispatchQueue.main.async {
//                let countriesViewModels = countries
//                    //countries.map { RegisterViewModel(country: $0) }
//                print(countriesViewModels)
//                completion(countriesViewModels)

            }
        }
    }
    
 }

