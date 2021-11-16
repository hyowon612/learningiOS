//
//  CountryTableViewCell.swift
//  WeatherToday
//
//  Created by Hyowon on 2021/09/12.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    var countryAssetName: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
