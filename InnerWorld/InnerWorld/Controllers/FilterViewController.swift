//
//  FilterViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 26/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    var appEngine = AppEngine()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let myTabBarViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MyTabBarViewController") as? MyTabBarViewController else{
            return
        }
        myTabBarViewController.appEngine = self.appEngine
        if let vc = myTabBarViewController.childViewControllers[0] as? HomeViewController {
            vc.appEngine = appEngine
        }
        if let vc = myTabBarViewController.childViewControllers[1] as? Create_Date_ViewController {
            vc.appEngine = appEngine
        }
        if let vc = myTabBarViewController.childViewControllers[2] as? SettingsViewController {
            vc.appEngine = appEngine
        }
        present(myTabBarViewController, animated: true, completion: nil)
    }
}
