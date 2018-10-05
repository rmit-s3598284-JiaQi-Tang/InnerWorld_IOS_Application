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

    @IBOutlet weak var greetingView: UIView!
    @IBOutlet weak var weatherView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        greetingView.layer.cornerRadius = 15

        let currentWeather = model.darkSkyApiData
        weatherImage = currentWeather.currently.icon
        weatherImageView.image = UIImage(named: weatherImage)
        dateLabel.text = DarkSkyDataHandler.handleDate(date: currentWeather.currently.time)
        temperatureLabel.text = DarkSkyDataHandler.handleTemperature(temperature: currentWeather.currently.temperature)
        humidityLabel.text = DarkSkyDataHandler.handleHumidity(humidity: currentWeather.currently.humidity)
        locationLabel.text = "\(model.city) \(model.state)"

        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        let currentWeather = model.darkSkyApiData
        if (!model.user.nickName!.isEmpty) {
            let randomNumber = Int(arc4random() % 7) + 1
            switch randomNumber {
            case 1:
                nameLabel.text = "Hey, \(model.user.nickName)! You are awsome!"
            case 2:
                nameLabel.text = "see u again, \(model.user.nickName)! How was your day?"
            case 3:
                nameLabel.text = "Hi, \(model.user.nickName)! Today is a good day"
            case 4:
                nameLabel.text = "\(model.user.nickName), Do you like today's weather?"
            case 5:
                nameLabel.text = "G'day, \(model.user.nickName)!"
            case 6:
                nameLabel.text = "\(model.user.nickName), How you doing?"
            case 7:
                nameLabel.text = "Yo, \(model.user.nickName)! Nice to see you!"
            default:
                nameLabel.text = "Hey, \(model.user.nickName)!"
            }

            print(DarkSkyDataHandler.handleDate(date: currentWeather.currently.time))
            print(model.user.birthday)
            if (DarkSkyDataHandler.handleBirthDay(date: currentWeather.currently.time) == model.user.birthday) {
                nameLabel.text = ", \(model.user.nickName)! Happy birthday"
            }
        } else {
            nameLabel.text = "G'day mate!"
        }
    }
    @IBAction func writeButtonTapped(_ sender: Any) {
        model.creatingDiary.location = locationLabel.text!
        model.creatingDiary.date = dateLabel.text!
        model.creatingDiary.weather = weatherImage
        //Perform segue
        performSegue(withIdentifier: "DateToMoodSegue", sender: nil)
    }
}

