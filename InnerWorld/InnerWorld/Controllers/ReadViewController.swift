//
//  ReadViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 27/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class ReadViewController: UIViewController {
    var model = Model.shared()

    //settings of the items on Reading Screen

    @IBOutlet weak var tittleOfReadScreen: UILabel!
    @IBOutlet weak var locationOfReadScreen: UILabel!
    @IBOutlet weak var weatherOfReadScreen: UIImageView!
    @IBOutlet weak var moodOfReadScreen: UIImageView!
    @IBOutlet weak var photoOfReadScreen: UIImageView!
    @IBOutlet weak var contentOfReadScreen: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let diary = model.readingDiary
        // Do any additional setup after loading the view.
        tittleOfReadScreen.text = diary.title
        locationOfReadScreen.text = diary.location
        weatherOfReadScreen.image = UIImage(named: (diary.weather! + ".png"))
        moodOfReadScreen.image = UIImage(named: (diary.mood! + ".png"))
        photoOfReadScreen.image = UIImage(named: (diary.photo! + ".jpg"))
        contentOfReadScreen.text = diary.content
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func editButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "ReadToEditSegue", sender: nil)
    }
    
}
