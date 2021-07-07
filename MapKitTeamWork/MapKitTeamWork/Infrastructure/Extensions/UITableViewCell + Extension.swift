//
//  UITableViewCell .swift
//  MapKitTeamWork
//
//  Created by MacBook  on 07.07.21.
//

import UIKit

extension UITableViewCell {
    
    static var identifier: String { String(describing: self) }
    
    static func nib() -> UINib { UINib(nibName: identifier, bundle: Bundle.main) }
}
