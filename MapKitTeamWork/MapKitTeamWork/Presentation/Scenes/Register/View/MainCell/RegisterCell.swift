//
//  RegisterCell.swift
//  MapKitTeamWork
//
//  Created by Mac User on 7/7/21.
//

import UIKit

class RegisterCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with item: RegisterViewModel) {
        countryNameLabel.text = item.name
      
    }
    
}
