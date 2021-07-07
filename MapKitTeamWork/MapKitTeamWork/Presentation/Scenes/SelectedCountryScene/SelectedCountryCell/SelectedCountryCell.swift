//
//  SelectedCountryCell.swift
//  MapKitTeamWork
//
//  Created by Nana Jimsheleishvili on 07.07.21.
//

import UIKit

class SelectedCountryCell: UITableViewCell {

    //MARK: - IBOutlet
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with item: CountryModel){
        countryNameLabel.text = item.country
    }
    
}
