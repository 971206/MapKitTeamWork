//
//  MainCountryCell.swift
//  MapKitTeamWork
//
//  Created by Ilia Tsikelashvili on 07.07.21.
//

import UIKit

class MainCountryCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with item: MainCountryViewModel) {
        countryLabel.text = item.name
    }
}
