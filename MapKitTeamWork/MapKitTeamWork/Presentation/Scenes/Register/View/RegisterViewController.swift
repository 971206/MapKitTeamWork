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
    private var dataSource: RegisterDataSource!
    private var countriesManager: CountryManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupLayout()
    }
    

    private func setupLayout() {
        tableView.registerNib(class: RegisterCell.self)
    }
  

}
