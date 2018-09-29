//
//  DarkSkyDataHandler.swift
//  InnerWorld
//
//  Created by Jacky Tang on 30/9/18.
//  Copyright © 2018 Linh Nguyen. All rights reserved.
//

import Foundation
import MapKit
class DarkSkyDataHandler {

    static func handleTemperature(temperature: Double) -> String {
        let handledTemperature = "\(String(format: "%.2f", 5 / 9 * (temperature - 32)))°C"
        return handledTemperature
    }
    static func handleHumidity(humidity: Double) -> String {
        let handledHumidity = "\(humidity * 100)% RH"
        return handledHumidity
    }
    static func handleDate(date: Date) -> String {
        let handledDate = "\("\(date)".prefix(10))"
        return handledDate
    }
    static func handleHour(date: Date) -> String {
        let handledHour = "\("\(date)".suffix(20).prefix(11))"
        return handledHour
    }
}
