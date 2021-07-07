//
//  CountriesDataSource.swift
//  MapKitTeamWork
//
//  Created by Mac User on 07.06.21.
//

import UIKit

class FirstDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Private properties
    
    private var tableView: UITableView!
    private var navigationController: UINavigationController?
//    private var viewModel: FirstViewModelProtocol!
    private var countriesManager: CountryManagerProtocol!
    
    private var countriesList = [CountryModel]()
    
    init(with tableView: UITableView, manager: CountryManagerProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.countriesManager = manager
        refresh()
    }
    
    func refresh() {
        countriesManager.fetchInfo { res in
            switch res {
            case .failure(let err):
                print("Failed: \(err)")
            case .success(let countries):
                
                self.countriesList = countries.map{$0}
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(FirstCell.self, for: indexPath)
        cell.configure(with: countriesList[indexPath.row])
        return cell
    }
}


// MARK: - UITableViewDelegate

extension FirstDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "MyMapViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MyMapViewController") as! MyMapViewController
        vc.country = countriesList[indexPath.row].country
        vc.coordinates = countriesList[indexPath.row].coordinates
        navigationController?.pushViewController(vc, animated: true)
    }
}

