//
//  ReadViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 27/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class ReadViewController: UIViewController {
    var appEngine = AppEngine.shared()
    var diary = Diary()

    //settings of the items on Reading Screen

    @IBOutlet weak var tittleOfReadScreen: UILabel!
    @IBOutlet weak var locationOfReadScreen: UILabel!
    @IBOutlet weak var weatherOfReadScreen: UIImageView!
    @IBOutlet weak var moodOfReadScreen: UIImageView!
    @IBOutlet weak var photoOfReadScreen: UIImageView!
    @IBOutlet weak var contentOfReadScreen: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tittleOfReadScreen.text = diary.tittle
        locationOfReadScreen.text = diary.location
        weatherOfReadScreen.image = UIImage(named: (diary.weather + ".png"))
        moodOfReadScreen.image = UIImage(named: (diary.mood + ".png"))
        photoOfReadScreen.image = UIImage(named: (diary.photo + ".jpg"))
        contentOfReadScreen.text = diary.content
    }

    @IBAction func backButtonTapped(_ sender: Any) {

        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let myTabBarViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MyTabBarViewController") as? MyTabBarViewController else{
            return
        }
        present(myTabBarViewController, animated: true, completion: nil)
    }
    @IBAction func editButtonTapped(_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as? EditViewController
        viewController?.diary = diary
        present(viewController!, animated: true, completion: nil)
    }
    
}
