//
//  City.swift
//  WeatherToday
//
//  Created by Hyowon on 2021/09/07.
//

import Foundation

struct City: Codable {
    
    let cityName: String
    let state: Int
    let celsius: Double
    let rainfall_probability: Int
    
    enum CodingKeys: String, CodingKey {
        case state, celsius, rainfall_probability
        case cityName = "city_name"
    }
}
