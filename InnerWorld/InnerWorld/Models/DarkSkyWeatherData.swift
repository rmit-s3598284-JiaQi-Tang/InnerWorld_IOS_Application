//
//  DarkSkyWeatherData.swift
//  InnerWorld
//
//  Created by Jacky Tang on 20/9/18.
//  Copyright © 2018 Linh Nguyen. All rights reserved.
//

import Foundation
struct DarkSkyWeatherData: Codable {
    let latitude: Double
    let longitude: Double
    let currently: CurrentWeather
    struct CurrentWeather: Codable {
        let time: Date
        let icon: String
        let temperature: Double
        let humidity: Double
    }
}
