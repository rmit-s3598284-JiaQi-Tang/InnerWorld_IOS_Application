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
    static func handleDate(date: Double) -> String {

        let newTime = NSDate(timeIntervalSince1970: date)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"


        let dateString = dateFormatter.string(from: newTime as Date)
        return dateString

    }
    static func handleBirthDay(date: Double) -> String {

        let newTime = NSDate(timeIntervalSince1970: date)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM"


        let dateString = dateFormatter.string(from: newTime as Date)
        return dateString

    }

    func timeFormatConverter(date: Double, format: String) -> String {

        let newDate = NSDate(timeIntervalSince1970: date)

        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = format
        let dateString = dayTimePeriodFormatter.string(from: newDate as Date)
        return dateString
    }
}

