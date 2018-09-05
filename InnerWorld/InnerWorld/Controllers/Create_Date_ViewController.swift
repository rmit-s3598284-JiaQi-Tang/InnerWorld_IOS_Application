//
//  SecondViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 23/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class Create_Date_ViewController: UIViewController {

    var appEngine = AppEngine()

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func writeButtonTapped(_ sender: Any) {

        let viewController = storyboard?.instantiateViewController(withIdentifier: "Create_Mood_View_Controller") as? Create_Mood_ViewController
        viewController?.appEngine = appEngine
        present(viewController!, animated: true, completion: nil)
        
    }
}

