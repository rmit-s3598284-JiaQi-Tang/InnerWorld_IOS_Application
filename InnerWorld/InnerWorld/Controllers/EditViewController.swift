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

    @IBOutlet weak var photoOfEditScreen: UIButton!
    @IBOutlet weak var locationOfEditScreen: UILabel!
    @IBOutlet weak var tittleOfEditScreen: UITextField!
    @IBOutlet weak var weatherOfEditScreen: UIButton!
    @IBOutlet weak var moodOfEditScreen: UIButton!
    @IBOutlet weak var contentOfEditScreen: UITextView!
    @IBOutlet weak var moodStackView: UIStackView!
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


// need to be modified
        photoOfEditScreen.setImage(diary.getUiImage(), for: .normal)
//        photoOfEditScreen.accessibilityIdentifier = diary.photo




        contentOfEditScreen.text = diary.content
        moodStackView.isHidden = true

    }

    @IBAction func pictureTapped(_ sender: Any) {

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
//        if let newPicture = photoOfEditScreen.accessibilityIdentifier {
//            diary.photo = newPicture
//        }
        let newDiary = Diary(diary: diary)
        model.saveDiaryToCoreData(diary: newDiary, existing: model.readingDiary)
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
