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
class Create_Date_ViewController: UIViewController {

    var model = Model.shared()
    var weatherImage = ""

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!

    override func viewDidLoad() {
        let currentWeather = model.darkSkyApiData
        self.weatherImageView.image = UIImage(named: weatherImage)
        self.weatherImage = currentWeather.currently.icon
        self.dateLabel.text = DarkSkyDataHandler.handleDate(date: currentWeather.currently.time)
        self.temperatureLabel.text = DarkSkyDataHandler.handleTemperature(temperature: currentWeather.currently.temperature)
        self.humidityLabel.text = DarkSkyDataHandler.handleHumidity(humidity: currentWeather.currently.humidity)
        self.locationLabel.text = "\(model.city) \(model.state)"
        super.viewDidLoad()
    }


    @IBAction func writeButtonTapped(_ sender: Any) {
        model.creatingDiary.location = locationLabel.text!
        model.creatingDiary.date = dateLabel.text!
        model.creatingDiary.weather = weatherImage
        //Perform segue
        performSegue(withIdentifier: "DateToMoodSegue", sender: nil)
    }
}

