//
//  RegisterCell.swift
//  MapKitTeamWork
//
//  Created by Mac User on 7/7/21.
//

import UIKit
//import MapKit


class FirstCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalNameLabel: UILabel!

//    var storyboard = UIStoryboard(name: "MapViewController", bundle: nil)
//    let navigationController = UINavigationController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with item: CountryModel) {
        countryNameLabel.text = item.country
        capitalNameLabel.text = item.capital

      
    }
}
//    @IBAction func onSeeMap(_ sender: Any) {
//        let vc = storyboard.instantiateViewController(withIdentifier: "MyMapViewController") as! MyMapViewController
//        self.navigationController.pushViewController(vc, animated: true)
//        print("tapped")
//
//    }
//
//
//}
//
//protocol tapDelegate {
//    func tapped(_ row: Int)
//}
