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
        
    }
    

    @IBAction func onChooseCountry(_ sender: Any) {
        ChooseCountry = chosen
        configureViewModel()
        transparentViewAdded(frames: ChooseCountry.frame)
    }
}


//extension FirstViewController {
//
//    func transparentViewAdded(frames: CGRect) {
//         transparentView.frame = self.view.frame
//         self.view.addSubview(transparentView)
//
//         tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
//         self.view.addSubview(tableView)
//         tableView.layer.cornerRadius = 5
//
//         transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
//         tableView.reloadData()
//         let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
//         transparentView.addGestureRecognizer(tapgesture)
//         transparentView.alpha = 0
//         UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
//             self.transparentView.alpha = 0.5
//             self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 500)
//         }, completion: nil)
//     }
//
//    @objc func removeTransparentView() {
//         let frames = chosen.frame
//         UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
//             self.transparentView.alpha = 0
//             self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
//         }, completion: nil)
//    }
//}
