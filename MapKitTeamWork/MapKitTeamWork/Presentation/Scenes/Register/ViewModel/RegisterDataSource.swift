//
//  CountriesDataSource.swift
//  27AniMekvabidze
//
//  Created by Mac User on 07.06.21.
//

import UIKit

class RegisterDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Private properties
    
    private var tableView: UITableView!
    private var viewModel: RegisterViewModelProtocol!
    
    private var countriesList = [RegisterViewModel]()
    
    init(with tableView: UITableView, viewModel: RegisterViewModelProtocol) {
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
        let cell = tableView.deque(RegisterCell.self, for: indexPath)
        cell.configure(with: countriesList[indexPath.row])
        return cell
    }
}


// MARK: - UITableViewDelegate

extension RegisterDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

