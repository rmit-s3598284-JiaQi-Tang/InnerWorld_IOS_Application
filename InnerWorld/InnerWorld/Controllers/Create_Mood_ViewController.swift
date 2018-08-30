//
//  Create_Mood_ViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 29/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class Create_Mood_ViewController: UIViewController {

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
