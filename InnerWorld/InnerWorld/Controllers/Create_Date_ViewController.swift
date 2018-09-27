//
//  SecondViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 23/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class Create_Date_ViewController: UIViewController {

    var appEngine = AppEngine.shared()
    var edittingDiray = Diary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var weatherImageView: UIImageView!

    @IBAction func writeButtonTapped(_ sender: Any) {

//        let viewController = storyboard?.instantiateViewController(withIdentifier: "Create_Mood_View_Controller") as? Create_Mood_ViewController
//        viewController?.edittingDiray.date = String("\(datePicker.date)".prefix(10))
//        viewController?.edittingDiray.location = cityTextField.text!
//        viewController?.edittingDiray.weather = "rain"
//        present(viewController!, animated: true, completion: nil)
        
        //this will be updated after implemented Rest API
        appEngine.creatingDiary.date = String("\(datePicker.date)".prefix(10))
        appEngine.creatingDiary.location = cityTextField.text!
        appEngine.creatingDiary.weather = "rain"
        //Perform segue
        performSegue(withIdentifier: "DateToMoodSegue", sender: nil)
    }
}

