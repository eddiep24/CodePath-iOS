//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Eddie Phillips on 2/19/22.
//  Copyright © 2022 memo. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var categoryType: UILabel!
    @IBOutlet weak var restaurantRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
