//
//  EditViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 4/9/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    var appEngine = AppEngine()
    var diary = Diary()

    @IBOutlet weak var tittleOfEditScreen: UITextField!
    @IBOutlet weak var locationOfEditScreen: UITextField!
    @IBOutlet weak var weatherOfEditScreen: UIButton!
    @IBOutlet weak var moodOfEditScreen: UIButton!
    @IBOutlet weak var photoOfEditScreen: UIImageView!
    @IBOutlet weak var contentOfEditScreen: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tittleOfEditScreen.text = diary.tittle
        locationOfEditScreen.text = diary.location
        weatherOfEditScreen.setImage(UIImage(named: (diary.weather + ".png")), for: .normal)
        moodOfEditScreen.setImage(UIImage(named: (diary.mood + ".png")), for: .normal)
        photoOfEditScreen.image = UIImage(named: (diary.photo + ".jpg"))
        contentOfEditScreen.text = diary.content
    }

    @IBAction func tickButtonTapped(_ sender: Any) {
        //
        // will do some editing to the local diary and replace it in appEngine here
        //

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
