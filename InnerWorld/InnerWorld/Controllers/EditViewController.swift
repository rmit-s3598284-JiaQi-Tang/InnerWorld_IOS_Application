//
//  EditViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 4/9/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    var model = Model.shared()
    var diary = Diary_CD()

    @IBOutlet weak var tittleOfEditScreen: UITextField!
    @IBOutlet weak var locationOfEditScreen: UITextField!
    @IBOutlet weak var weatherOfEditScreen: UIButton!
    @IBOutlet weak var moodOfEditScreen: UIButton!
    @IBOutlet weak var photoOfEditScreen: UIImageView!
    @IBOutlet weak var contentOfEditScreen: UITextView!
    @IBOutlet weak var weatherStackView: UIStackView!
    @IBOutlet weak var moodStackView: UIStackView!
    @IBAction func weatherButtonTapped(_ sender: Any) {
        weatherStackView.isHidden = !weatherStackView.isHidden
    }
    @IBAction func moodButtonTapped(_ sender: Any) {
        moodStackView.isHidden = !moodStackView.isHidden
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        diary = model.readingDiary
        // Do any additional setup after loading the view.
        tittleOfEditScreen.text = diary.title
        locationOfEditScreen.text = diary.location
        weatherOfEditScreen.setImage(UIImage(named: (diary.weather! + ".png")), for: .normal)
        weatherOfEditScreen.accessibilityIdentifier = diary.weather
        moodOfEditScreen.setImage(UIImage(named: (diary.mood! + ".png")), for: .normal)
        moodOfEditScreen.accessibilityIdentifier = diary.mood
        photoOfEditScreen.image = UIImage(named: (diary.photo! + ".jpg"))
        contentOfEditScreen.text = diary.content
        moodStackView.isHidden = true
        weatherStackView.isHidden = true
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tickButtonTapped(_ sender: Any) {
        diary.title = tittleOfEditScreen.text!
        diary.location = locationOfEditScreen.text!
        diary.content = contentOfEditScreen.text!
        if let newWeather = weatherOfEditScreen.accessibilityIdentifier {
            diary.weather = newWeather
        }
        if let newMood = moodOfEditScreen.accessibilityIdentifier {
            diary.mood = newMood
        }
        let newDiary = Diary(diary: diary)
        model.saveDiaryToCoreData(diary: newDiary, existing: model.readingDiary)
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func sunnyButtonTapped(_ sender: Any) {
        weatherOfEditScreen.setImage(UIImage(named: "sunny.png"), for: .normal)
        weatherOfEditScreen.accessibilityIdentifier = "sunny"
        weatherStackView.isHidden = true
    }
    @IBAction func cloudButtonTapped(_ sender: Any) {
        weatherOfEditScreen.setImage(UIImage(named: "cloud.png"), for: .normal)
        weatherOfEditScreen.accessibilityIdentifier = "cloud"
        weatherStackView.isHidden = true
    }
    @IBAction func windyButtonTapped(_ sender: Any) {
        weatherOfEditScreen.setImage(UIImage(named: "windy.png"), for: .normal)
        weatherOfEditScreen.accessibilityIdentifier = "windy"
        weatherStackView.isHidden = true
    }
    @IBAction func lightRainButtonTapped(_ sender: Any) {
        weatherOfEditScreen.setImage(UIImage(named: "light rain.png"), for: .normal)
        weatherOfEditScreen.accessibilityIdentifier = "light rain"
        weatherStackView.isHidden = true
    }
    @IBAction func rainingButtonTapped(_ sender: Any) {
        weatherOfEditScreen.setImage(UIImage(named: "rainning.png"), for: .normal)
        weatherOfEditScreen.accessibilityIdentifier = "rainning"
        weatherStackView.isHidden = true
    }
    @IBAction func heavyRainButtonTapped(_ sender: Any) {
        weatherOfEditScreen.setImage(UIImage(named: "heavy rain.png"), for: .normal)
        weatherOfEditScreen.accessibilityIdentifier = "heavy rain"
        weatherStackView.isHidden = true
    }
    @IBAction func stormButtonTapped(_ sender: Any) {
        weatherOfEditScreen.setImage(UIImage(named: "storm.png"), for: .normal)
        weatherOfEditScreen.accessibilityIdentifier = "storm"
        weatherStackView.isHidden = true
    }
    @IBAction func snowyButtonTapped(_ sender: Any) {
        weatherOfEditScreen.setImage(UIImage(named: "snowy.png"), for: .normal)
        weatherOfEditScreen.accessibilityIdentifier = "snowy"
        weatherStackView.isHidden = true
    }
    @IBAction func smileButtonTapped(_ sender: Any) {
        moodOfEditScreen.setImage(UIImage(named: "smile.png"), for: .normal)
        moodOfEditScreen.accessibilityIdentifier = "smile"
        moodStackView.isHidden = true
    }
    @IBAction func happyButtonTapped(_ sender: Any) {
        moodOfEditScreen.setImage(UIImage(named: "happy.png"), for: .normal)
        moodOfEditScreen.accessibilityIdentifier = "happy"
        moodStackView.isHidden = true
    }
    @IBAction func sadButtonTapped(_ sender: Any) {
        moodOfEditScreen.setImage(UIImage(named: "sad.png"), for: .normal)
        moodOfEditScreen.accessibilityIdentifier = "sad"
        moodStackView.isHidden = true
    }
    @IBAction func cryButtonTapped(_ sender: Any) {
        moodOfEditScreen.setImage(UIImage(named: "cry.png"), for: .normal)
        moodOfEditScreen.accessibilityIdentifier = "cry"
        moodStackView.isHidden = true
    }

}
