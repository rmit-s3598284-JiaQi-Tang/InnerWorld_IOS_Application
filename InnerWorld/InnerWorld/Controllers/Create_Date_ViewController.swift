//
//  SecondViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 23/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit
import MapKit
class Create_Date_ViewController: UIViewController {

    var model = Model.shared()
    var darkSkyWeatherDataManager = DarkSkyWeatherDataManager.shared
    var weatherImage = ""

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // get current weather condition from Rest API
        darkSkyWeatherDataManager.weatherDataAt(latitude: -37.767494, longitude: 144.945227) { currentWeather, error in
            DispatchQueue.main.async {
                if let weatherImage = currentWeather?.currently.icon, let date = currentWeather?.currently.time, let temperature = currentWeather?.currently.temperature, let humidity = currentWeather?.currently.humidity {

                    self.weatherImageView.image = UIImage(named: weatherImage)
                    self.weatherImage = weatherImage
                    self.dateLabel.text = "\("\(date)".prefix(10))"
                    self.temperatureLabel.text = DarkSkyDataHandler.handleTemperature(temperature: temperature)
                    self.humidityLabel.text = DarkSkyDataHandler.handleHumidity(humidity: humidity)
                }
                let geoCoder = CLGeocoder()
                let location = CLLocation(latitude: -37.767494, longitude: 144.945227)
                geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, _) -> Void in
                    placemarks?.forEach { (placemark) in
                        if let city = placemark.locality {
                            self.locationLabel.text = city
                        }
                    }
                })
            }
        }
    }


    @IBAction func writeButtonTapped(_ sender: Any) {
        //this will be updated after implemented Rest API
        
//        appEngine.creatingDiary.date = String("\(datePicker.date)".prefix(10))
        model.creatingDiary.location = locationLabel.text!
        model.creatingDiary.weather = weatherImage
        //Perform segue
        performSegue(withIdentifier: "DateToMoodSegue", sender: nil)
    }
}

