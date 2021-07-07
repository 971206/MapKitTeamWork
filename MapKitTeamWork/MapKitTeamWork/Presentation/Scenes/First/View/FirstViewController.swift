//
//  ViewController.swift
//  MapKitTeamWork
//
//  Created by Mac User on 7/7/21.
//

import UIKit
import MapKit


class FirstViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: FirstViewModelProtocol!
    private var dataSource: FirstDataSource!
    private var countriesManager: CountryManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        configureViewModel()
    }
    

    private func setupLayout() {
        tableView.registerNib(class: FirstCell.self)
    }
    
    private func configureViewModel() {
        countriesManager = CountryManager()
        // DI - Dependenc Injection
        viewModel = FirstListViewModel(with: countriesManager)
        dataSource = FirstDataSource(with: tableView, viewModel: viewModel)
        
    }

}
