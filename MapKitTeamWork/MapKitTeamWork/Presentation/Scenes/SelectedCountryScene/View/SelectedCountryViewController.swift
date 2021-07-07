//
//  SelectedCountryViewController.swift
//  MapKitTeamWork
//
//  Created by Nana Jimsheleishvili on 07.07.21.
//

import UIKit

class SelectedCountryViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private variables
    private var dataSource: SelectedCountryDataSource!
    private var viewModel: SelectedCountryViewModelProtocol!
    var countries = [CountryModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureDataSource()
        setupLayout()
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    // MARK: - Setup
    private func setupLayout() {
        tableView.registerNib(class: SelectedCountryCell.self)
    }
    private func configureDataSource() {
        viewModel = SelectedCountryViewModel(controller: self)
        dataSource = SelectedCountryDataSource(with: tableView, countries: countries, viewModel: viewModel)
        dataSource.refresh()
    }

}
