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
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with item: CountryModel) {
        countryNameLabel.text = item.country
      
    }
}
