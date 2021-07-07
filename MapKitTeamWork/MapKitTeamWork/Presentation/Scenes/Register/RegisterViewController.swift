//
//  RegisterViewController.swift
//  MapKitTeamWork
//
//  Created by Lizi Chichua on 7/7/21.
//

import UIKit

class CellClass: UITableViewCell {
    
}

class RegisterViewController: BaseViewController {

    @IBOutlet weak var selectCountryBtn: UIButton!
    
    let transparentView = UIView()
    let tableView = UITableView()
    
    var selectedButton = UIButton()
    
    var countries = [CountryModel]()
    var countryManager: CountryManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellClass.self, forCellReuseIdentifier: "Cell")
        fetchCountriesData()
    }
    
    func fetchCountriesData() {
        countryManager = CountryManager()
        countryManager.fetchInfo { res in
            switch res {
            case .failure(let err):
                print("Failed: \(err)")
            case .success(let countries):
                
                self.countries = countries.map{$0}
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func addTransparentView(frames: CGRect) {
         transparentView.frame = self.view.frame
         self.view.addSubview(transparentView)
         
         tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
         self.view.addSubview(tableView)
         tableView.layer.cornerRadius = 5
         
         transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
         tableView.reloadData()
         let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
         transparentView.addGestureRecognizer(tapgesture)
         transparentView.alpha = 0
         UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
             self.transparentView.alpha = 0.5
             self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 500)
         }, completion: nil)
     }
    
    @objc func removeTransparentView() {
         let frames = selectedButton.frame
         UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
             self.transparentView.alpha = 0
             self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
         }, completion: nil)
    }

    @IBAction func onSelectCountry(_ sender: Any) {
        selectedButton = selectCountryBtn
        addTransparentView(frames: selectCountryBtn.frame)
    }
}


extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].country
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "MapDetViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MapDetViewController") as! MapDetViewController
        vc.country = countries[indexPath.row].country
        vc.coordinates = countries[indexPath.row].coordinates
        navigationController?.pushViewController(vc, animated: true)
    }
}
