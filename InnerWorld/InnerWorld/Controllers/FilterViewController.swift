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
    let happyData = UIImagePNGRepresentation(#imageLiteral(resourceName: "happy"))
    let sadData = UIImagePNGRepresentation(#imageLiteral(resourceName: "sad"))
    let smileData = UIImagePNGRepresentation(#imageLiteral(resourceName: "smile"))
    let cryData = UIImagePNGRepresentation(#imageLiteral(resourceName: "cry"))

    override func viewDidLoad() {
        super.viewDidLoad()

        rightFaceImage.image = #imageLiteral(resourceName: "sad")
        leftFaceImage.image = #imageLiteral(resourceName: "smile")
        midFaceImage.image = #imageLiteral(resourceName: "happy")
        backFaceImage.image = #imageLiteral(resourceName: "cry")

    }

    @IBOutlet weak var backFaceImage: UIImageView!
    @IBOutlet weak var leftFaceImage: UIImageView!
    @IBOutlet weak var rightFaceImage: UIImageView!
    @IBOutlet weak var midFaceImage: UIImageView!

    @IBAction func leftButton(_ sender: Any) {
        let midImageData = UIImagePNGRepresentation(midFaceImage.image!)
        if midImageData == happyData {
            midFaceImage.image = #imageLiteral(resourceName: "smile")
            leftFaceImage.image = #imageLiteral(resourceName: "happy")
            rightFaceImage.image = #imageLiteral(resourceName: "cry")
            backFaceImage.image = #imageLiteral(resourceName: "sad")
        }
        if midImageData == sadData {
            midFaceImage.image = #imageLiteral(resourceName: "happy")
            rightFaceImage.image = #imageLiteral(resourceName: "smile")
            leftFaceImage.image = #imageLiteral(resourceName: "sad")
            backFaceImage.image = #imageLiteral(resourceName: "cry")
        }
        if midImageData == smileData {
            midFaceImage.image = #imageLiteral(resourceName: "cry")
            rightFaceImage.image = #imageLiteral(resourceName: "sad")
            leftFaceImage.image = #imageLiteral(resourceName: "smile")
            backFaceImage.image = #imageLiteral(resourceName: "happy")
        }
        if midImageData == cryData {
            midFaceImage.image = #imageLiteral(resourceName: "sad")
            rightFaceImage.image = #imageLiteral(resourceName: "happy")
            leftFaceImage.image = #imageLiteral(resourceName: "cry")
            backFaceImage.image = #imageLiteral(resourceName: "smile")
        }

    }

    @IBAction func rightButton(_ sender: Any) {
        let midImageData = UIImagePNGRepresentation(midFaceImage.image!)
        if midImageData == happyData {
            midFaceImage.image = #imageLiteral(resourceName: "sad")
            leftFaceImage.image = #imageLiteral(resourceName: "cry")
            rightFaceImage.image = #imageLiteral(resourceName: "happy")
            backFaceImage.image = #imageLiteral(resourceName: "smile")
        }
        if midImageData == sadData {
            midFaceImage.image = #imageLiteral(resourceName: "cry")
            rightFaceImage.image = #imageLiteral(resourceName: "sad")
            leftFaceImage.image = #imageLiteral(resourceName: "smile")
            backFaceImage.image = #imageLiteral(resourceName: "happy")
        }
        if midImageData == smileData {
            midFaceImage.image = #imageLiteral(resourceName: "happy")
            rightFaceImage.image = #imageLiteral(resourceName: "smile")
            leftFaceImage.image = #imageLiteral(resourceName: "sad")
            backFaceImage.image = #imageLiteral(resourceName: "cry")
        }
        if midImageData == cryData {
            midFaceImage.image = #imageLiteral(resourceName: "smile")
            rightFaceImage.image = #imageLiteral(resourceName: "cry")
            leftFaceImage.image = #imageLiteral(resourceName: "happy")
            backFaceImage.image = #imageLiteral(resourceName: "sad")
        }
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
