//
//  MainDataSource.swift
//  main
//
//  Created by Ilia Tsikelashvili on 07.07.21.
//

import Foundation
import UIKit

class MainDataSource: NSObject, UITableViewDataSource {
    private var tableView: UITableView!
    private var viewModel: MainViewModelProtocol!
    
    private var filteredCountriesList = [MainCountryViewModel]()
    private var countriesList = [MainCountryViewModel]()
    
    private var countries = [CountryModel]()
    
    init(with tableView: UITableView, viewModel: MainViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.viewModel = viewModel
    }
    
    func refresh() {
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
    
    func search(with text: String) {
        filteredCountriesList.removeAll()
        
        for country in countriesList {
            if country.name.lowercased().contains(text.lowercased()) {
                filteredCountriesList.append(country)
            }
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(MainCountryCell.self, for: indexPath)
        cell.configure(with: filteredCountriesList[indexPath.row])
        return cell
    }
}

extension MainDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark

    }
}

