//
//  DarkSkyWeatherData.swift
//  InnerWorld
//
//  Created by Jacky Tang on 20/9/18.
//  Copyright © 2018 Linh Nguyen. All rights reserved.
//

import Foundation
import MapKit

struct CurrentWeather: Codable {
    let time: Double
    let icon: String
    let temperature: Double
    let humidity: Double

    init () {
        time = 0
        icon = ""
        temperature = 0
        humidity = 0
    }
}

class ApiWeather: Codable {
    var latitude: Double
    var longitude: Double

    var currently: CurrentWeather

    init(){
        latitude = 0
        longitude = 0

        currently = CurrentWeather()
    }
}

