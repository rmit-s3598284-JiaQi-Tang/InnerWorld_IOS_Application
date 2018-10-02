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
            guard let placemarks = placemarks else {
                return
            }
            if(placemarks.count > 0) {
                if let placeMark = placemarks.first {
                    self.getWeather(placeMark: placeMark)
                }
            } else if (error == nil && placemarks.count == 0) {
                print("none location callback");
            }
            else if ((error) != nil) {
                print("location error\(String(describing: error))");
            }
        }
    }

    func getWeather (placeMark: CLPlacemark) {
        // get current weather condition from Rest API
        if let location = placeMark.location {

            darkSkyWeatherDataManager.weatherDataAt(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) { currentWeather, error in
                DispatchQueue.main.async {

                    //load & handle view data

                    if let weatherImage = currentWeather?.currently.icon, let date = currentWeather?.currently.time, let temperature = currentWeather?.currently.temperature, let humidity = currentWeather?.currently.humidity {

                        self.weatherImageView.image = UIImage(named: weatherImage)
                        self.weatherImage = weatherImage
                        self.dateLabel.text = DarkSkyDataHandler.handleDate(date: date)
                        self.temperatureLabel.text = DarkSkyDataHandler.handleTemperature(temperature: temperature)
                        self.humidityLabel.text = DarkSkyDataHandler.handleHumidity(humidity: humidity)
                    }

                    if let locationName = placeMark.locality, let state = placeMark.administrativeArea {

                        self.locationLabel.text = "\(locationName) \(state)"

                    }

                }
            }
        }
    }
}

