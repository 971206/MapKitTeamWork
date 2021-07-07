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
    private var viewModel: FirstViewModelProtocol!
    
    private var countriesList = [FirstViewModel]()
    
    init(with tableView: UITableView, viewModel: FirstViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.viewModel = viewModel
    }
    
    func refresh() {
        viewModel.getCountriesList { countries in
            self.countriesList.append(contentsOf: countries)
            self.tableView.reloadData()
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
        print(indexPath.row)
    }
}
