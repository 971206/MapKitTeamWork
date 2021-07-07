//
//  ViewController.swift
//  MapKitTeamWork
//
//  Created by Mac User on 7/7/21.
//

import UIKit

class RegisterViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: RegisterViewModelProtocol!
    private var dataSource: FirstDataSource!
    private var countriesManager: CountryManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupLayout()
        configureViewModel()
    }
    

    private func setupLayout() {
        tableView.registerNib(class: RegisterCell.self)
    }
    
    private func configureViewModel() {
        countriesManager = CountryManager()
        // DI - Dependenc Injection
        viewModel = FirstListViewModel(with: countriesManager)
        dataSource = FirstDataSource(with: tableView, viewModel: viewModel)
        
    }

}
