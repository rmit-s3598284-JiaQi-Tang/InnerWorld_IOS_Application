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
    var latitude = -37.767494
    var longitude = 144.945227

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getWeather()
    }


    @IBAction func writeButtonTapped(_ sender: Any) {
        //this will be updated after implemented Rest API
        
//        appEngine.creatingDiary.date = String("\(datePicker.date)".prefix(10))
        model.creatingDiary.location = locationLabel.text!
        model.creatingDiary.date = dateLabel.text!
        model.creatingDiary.weather = weatherImage
        //Perform segue
        performSegue(withIdentifier: "DateToMoodSegue", sender: nil)
    }

    func getWeather() {
        // get current weather condition from Rest API
        darkSkyWeatherDataManager.weatherDataAt(latitude: self.latitude, longitude: self.longitude) { currentWeather, error in
            DispatchQueue.main.async {
                if let weatherImage = currentWeather?.currently.icon, let date = currentWeather?.currently.time, let temperature = currentWeather?.currently.temperature, let humidity = currentWeather?.currently.humidity {

                    self.weatherImageView.image = UIImage(named: weatherImage)
                    self.weatherImage = weatherImage
                    self.dateLabel.text = DarkSkyDataHandler.handleDate(date: date)
                    self.temperatureLabel.text = DarkSkyDataHandler.handleTemperature(temperature: temperature)
                    self.humidityLabel.text = DarkSkyDataHandler.handleHumidity(humidity: humidity)
                }
                let geoCoder = CLGeocoder()
                let location = CLLocation(latitude: self.latitude, longitude: self.longitude)
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
}

