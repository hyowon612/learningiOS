//
//  Country.swift
//  WeatherToday
//
//  Created by Hyowon on 2021/09/07.
//

import Foundation

struct Country: Codable {
    
    let countryName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey {
        case countryName = "korean_name"
        case assetName = "asset_name"
    }
}
