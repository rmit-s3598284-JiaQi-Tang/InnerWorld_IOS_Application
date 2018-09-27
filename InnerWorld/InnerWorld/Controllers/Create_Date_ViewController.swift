//
//  SecondViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 23/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class Create_Date_ViewController: UIViewController {

//    var appEngine = AppEngine.shared()
    var model = Model.shared()
//    var edittingDiray = Diary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var weatherImageView: UIImageView!

    @IBAction func writeButtonTapped(_ sender: Any) {
        //this will be updated after implemented Rest API
        
//        appEngine.creatingDiary.date = String("\(datePicker.date)".prefix(10))
        model.creatingDiary.location = cityTextField.text!
        model.creatingDiary.weather = "rain"
        //Perform segue
        performSegue(withIdentifier: "DateToMoodSegue", sender: nil)
    }
}

