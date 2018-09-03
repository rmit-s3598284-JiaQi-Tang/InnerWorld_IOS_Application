//
//  Create_Mood_ViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 29/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class Create_Mood_ViewController: UIViewController {

    var appEngine = AppEngine()

    @IBOutlet weak var moodImage: UIImageView!
    @IBAction func moodSlider(_ sender: UISlider) {
        sender.minimumValue = 0
        sender.maximumValue = 100
        var currentMood: String {
            get {
                if sender.value >= 25 && sender.value < 50 {
                    return "sad.png"
                }
                if sender.value >= 50 && sender.value < 75 {
                    return "happy.png"
                }
                if sender.value >= 75 {
                    return "smile.png"
                }
                return "cry.png"
            }
        }
        if let image = UIImage(named:currentMood) {
            moodImage.image = image
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func forwardButtonTapped(_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "Create_Content_View_Controller") as? Create_Content_ViewController
        viewController?.appEngine = appEngine
        present(viewController!, animated: true, completion: nil)
    }
}
