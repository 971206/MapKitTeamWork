//
//  ViewController.swift
//  MapKitTeamWork
//
//  Created by MacBook  on 07.07.21.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: MainViewModelProtocol!
    private var dataSource: MainDataSource!
    private var countriesManager: CountryManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configureViewModel()
        bindings()
        dataSource.refresh()
    }


    @IBAction func goToMap(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainMapViewController") as! MainMapViewController
        navigationController?.pushViewController(vc, animated: true)
//        dataSource.refresh()
    }
    
    private func setupLayout() {
        searchBar.delegate = self
        tableView.registerNib(class: MainCountryCell.self)
    }
    
    private func configureViewModel() {
        countriesManager = CountryManager()
        viewModel        = MainViewModel(with: countriesManager)
        dataSource       = MainDataSource(with: tableView, viewModel: viewModel)
        
    }
    
    private func bindings() {
        viewModel.didFinishedLoading = {
//            self.spinner.stopAnimating()
        }
    }
}


extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dataSource.search(with: searchText)
    }
}

