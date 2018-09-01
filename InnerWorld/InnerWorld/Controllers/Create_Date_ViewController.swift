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
        let vc = self.tabBarController as! MyTabBarViewController
        appEngine = vc.appEngine
    }

    override func viewWillDisappear(_ animated: Bool) {
        let vc = self.tabBarController as! MyTabBarViewController
        vc.appEngine = appEngine
    }


}

