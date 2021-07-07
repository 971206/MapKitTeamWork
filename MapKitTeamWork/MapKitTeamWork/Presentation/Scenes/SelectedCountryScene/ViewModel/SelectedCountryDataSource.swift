//
//  SelectedCountryDataSource.swift
//  MapKitTeamWork
//
//  Created by Nana Jimsheleishvili on 07.07.21.
//

import UIKit

class SelectedCountryDataSource: NSObject, UITableViewDataSource{
    
    // MARK: - Private variables
    private var tableView: UITableView!
    private var viewModel: SelectedCountryViewModelProtocol!
    private var countries = [CountryModel]()
    
    // MARK: - init
    init(with tableView: UITableView, countries: [CountryModel], viewModel: SelectedCountryViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.countries = countries
        self.viewModel = viewModel
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func refresh () {
        viewModel.fetchCountries { [weak self] result in
            switch result {
            case .success(let countries):
                self?.countries = countries
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    //MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(SelectedCountryCell.self, for: indexPath)
        cell.configure(with: countries[indexPath.row])
        return cell
    }
}

//MARK: - Table View Delegate
extension SelectedCountryDataSource: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.controller.coordinator?.proceedToSelectedCountryMapVC(with: countries[indexPath.row], coordinator: viewModel.controller.coordinator!)
    }
}
