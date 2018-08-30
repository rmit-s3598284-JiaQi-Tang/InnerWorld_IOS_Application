//
//  ReadViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 27/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class ReadViewController: UIViewController {
    var diary = Diary()
//settings of the stack buttons
    @IBOutlet var operatingButtons: [UIButton]!
    @IBAction func handelSelection(_ sender: UIButton) {
        operatingButtons.forEach { (button) in
            button.isHidden = !button.isHidden
        }
    }
    @IBAction func operatingTapped(_ sender: UIButton) {
    }

    @IBAction func deleteButton(_ sender: Any) {
        let alert = UIAlertController(title: "are you sure to delete this diary? ", message: " ", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: {Void in})
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {Void in})
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
