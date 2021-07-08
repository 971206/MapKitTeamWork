//
//  MainViewModel.swift
//  main
//
//  Created by Ilia Tsikelashvili on 07.07.21.
//

import Foundation
import UIKit

protocol MainViewModelProtocol: AnyObject {
    func fetchCountries(completion: @escaping((Result<[CountryModel], Error>) -> Void)) 
    var didFinishedLoading: (() -> Void)? { get set }
    var navigationItem: UINavigationItem? { get set }
    func setTitle(with text: String, on navigationItem: UINavigationItem)
    var controller: CoordinatorDelegate { get }
    init(with countriesManager: CountryManagerProtocol, and controller: CoordinatorDelegate)
}

class MainViewModel: MainViewModelProtocol {
 
        
    private var countriesManager: CountryManagerProtocol!
    private(set) var controller: CoordinatorDelegate

    var didFinishedLoading: (() -> Void)?
    
    
    var navigationItem: UINavigationItem?
    
    required init(with countriesManager: CountryManagerProtocol, and controller: CoordinatorDelegate)  {
        self.countriesManager = countriesManager
        self.controller = controller
    }
    
//    func getCountriesList(completion: @escaping (([MainCountryViewModel]) -> Void)) {
//        countriesManager.fetchInfo { countries in
//            DispatchQueue.main.async {
//                controller.coordinator?.countryManager.fetchInfo(completion: completion)
//
//                let countriesViewModels =  countries.map { MainCountryViewModel(country: $0) }
//
//                completion(countriesViewModels)
//            }
//        }
//    }
    
    func fetchCountries(completion: @escaping((Result<[CountryModel], Error>) -> Void)) {
        controller.coordinator?.countryManager.fetchInfo(completion: completion)

    }
    
    func setTitle(with text: String, on navigationItem: UINavigationItem) {
        navigationItem.title = text
    }
    
}
