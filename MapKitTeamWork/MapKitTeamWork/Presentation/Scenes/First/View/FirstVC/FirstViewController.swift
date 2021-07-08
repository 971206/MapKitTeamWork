//
//  ViewController.swift
//  MapKitTeamWork
//
//  Created by Mac User on 7/7/21.
//

import UIKit
import MapKit


class FirstViewController: BaseViewController {
   // @IBOutlet weak var tableView: UITableView!
    let tableView = UITableView()

    @IBOutlet weak var ChooseCountry: UIButton!
    var chosen = UIButton()
    let transparentView = UIView()


//    private var viewModel: FirstViewModelProtocol!
    private var dataSource: FirstDataSource!
    private var countriesManager: CountryManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        setupLayout()
        
    }
    

    private func setupLayout() {
        tableView.registerNib(class: FirstCell.self)
    }
    
    private func configureViewModel() {
        countriesManager = CountryManager()
        dataSource = FirstDataSource(with: tableView, manager: countriesManager)
        DispatchQueue.main.async { [weak self] in
            self?.dataSource.refresh()
            self?.tableView.reloadData()
        }
        
    }
    

    @IBAction func onChooseCountry(_ sender: Any) {
        chosen = ChooseCountry
        transparentViewAdded(frames: ChooseCountry.frame)
     //   configureViewModel()

    }
}

