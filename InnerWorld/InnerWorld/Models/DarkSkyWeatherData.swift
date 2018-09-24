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
    let daily: Daily
    struct CurrentWeather: Codable {
        let time: Date
        let icon: String
        let temperature: Double
    }
    struct Daily: Codable {
        let data: [Data]
        struct Data: Codable {
            let time: Date
            let icon: String
            let temperatureMax: Double
            let temperatureMin: Double
        }
    }
}
