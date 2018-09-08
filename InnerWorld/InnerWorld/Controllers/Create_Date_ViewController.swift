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

        let viewController = storyboard?.instantiateViewController(withIdentifier: "Create_Mood_View_Controller") as? Create_Mood_ViewController
        viewController?.edittingDiray.date = "\(datePicker.date)"
        viewController?.edittingDiray.location = cityTextField.text!
        viewController?.edittingDiray.weather = "rainning"          //this will be updated after implemented Rest API
        present(viewController!, animated: true, completion: nil)

    }
}

