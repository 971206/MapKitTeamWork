//
//  CountryManager.swift
//  ThreeTeamWork
//
//  Created by Nana Jimsheleishvili on 07.07.21.
//

import Foundation

protocol CountryManagerProtocol: AnyObject {
    func fetchInfo(completion: @escaping ((Result<[CountryModel], Error>) -> Void))
 //   func fetchInfo(completion: @escaping ([CountryModel]) -> Void)
   // func fetchInfo(completion: @escaping (([CountryModel]) -> Void))


}

class CountryManager: CountryManagerProtocol {
    func fetchInfo(completion: @escaping (([CountryModel]) -> Void)) {
            let url = "https://restcountries.eu/rest/v2/all"
            NetworkManager.shared.get(url: url) { (result: Result<[CountryModel], Error>) in
                switch result {
                case .success(let countries):
                    completion(countries)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
   
    
//    func fetchInfo(completion: @escaping ([CountryModel]) -> Void)) {
//        let url = "https://restcountries.eu/rest/v2/region/Americas"
//        NetworkManager.shared.get(url: url) { (result: Result<[CountryModel], Error>) in
//            switch result {
//            case .success(let response):
//                completion(.success(response))
//            case .failure(let err):
//                completion(.failure(err))
//            }
//        }
//    }

