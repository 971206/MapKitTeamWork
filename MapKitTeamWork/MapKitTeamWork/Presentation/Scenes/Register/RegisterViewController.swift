//
//  RegisterViewController.swift
//  MapKitTeamWork
//
//  Created by Macbook Air on 7/7/21.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var selectCountryBtn: UIButton!
    
    let transparentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func addTransparentView() {
        transparentView.frame = self.view.frame
        self.view.addSubview(transparentView)
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
    }

    @IBAction func onSelectCountry(_ sender: Any) {
    }
}
