//
//  SecondViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 23/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class Create_Date_ViewController: UIViewController, CLLocationManagerDelegate {

    var model = Model.shared()
    var darkSkyWeatherDataManager = DarkSkyWeatherDataManager.shared
    var weatherImage = ""
    let locationManager = CLLocationManager()

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }

    }


    @IBAction func writeButtonTapped(_ sender: Any) {
        //this will be updated after implemented Rest API

        model.creatingDiary.location = locationLabel.text!
        model.creatingDiary.date = dateLabel.text!
        model.creatingDiary.weather = weatherImage
        //Perform segue
        performSegue(withIdentifier: "DateToMoodSegue", sender: nil)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        let changeLocation:NSArray =  locations as NSArray
        let currentLocation = changeLocation.lastObject as! CLLocation
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(currentLocation) { (placemarks, error) in
            if((placemarks?.count)! > 0) {
                let placeMark = placemarks?.first

                self.getWeather(latitude: (placeMark?.location?.coordinate.latitude)!, longitude: (placeMark?.location?.coordinate.longitude)!)

            } else if (error == nil && placemarks?.count == 0) {
                print("none location callback");
            }
            else if ((error) != nil) {
                print("location error\(String(describing: error))");
            }
        }
    }

    func getWeather(latitude: Double, longitude: Double) {
        // get current weather condition from Rest API
        darkSkyWeatherDataManager.weatherDataAt(latitude: latitude, longitude: longitude) { currentWeather, error in
            DispatchQueue.main.async {
                if let weatherImage = currentWeather?.currently.icon, let date = currentWeather?.currently.time, let temperature = currentWeather?.currently.temperature, let humidity = currentWeather?.currently.humidity {

                    self.weatherImageView.image = UIImage(named: weatherImage)
                    self.weatherImage = weatherImage
                    self.dateLabel.text = DarkSkyDataHandler.handleDate(date: date)
                    self.temperatureLabel.text = DarkSkyDataHandler.handleTemperature(temperature: temperature)
                    self.humidityLabel.text = DarkSkyDataHandler.handleHumidity(humidity: humidity)
                }
                let geoCoder = CLGeocoder()
                let location = CLLocation(latitude: latitude, longitude: longitude)
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

