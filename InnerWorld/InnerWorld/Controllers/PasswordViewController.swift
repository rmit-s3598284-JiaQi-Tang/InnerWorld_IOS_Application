//
//  PasswordViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 26/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {
    //initial the app with solid data
    var appEngine = AppEngine(diaryList: [Diary(tittle: "A happy day in St Kilda", date: "08-Aug-2018", mood: "smile", weather: "sunny", location: "St Kilda, Melbourne", photo: "prototype-diaryPicture", content: "Today, I went to St kilda beach with my Indian brother Manana. We took a lot of awesome pictures there! what a happy day!"),Diary(tittle: "Lost 100$ in China Town", date: "6-Aug-2018", mood: "cry", weather: "rainning", location: "China Town, Melbourne", photo: "prototype-diaryPicture2", content: "Today, I went to China Town alone for some Chinese food. I lost my precious 100$! what a bad day!"),Diary(tittle: "Learning Swift is fun!", date: "1-Aug-2018", mood: "happy", weather: "cloud", location: "RMIT, Melbourne", photo: "prototype-diaryPicture3", content: "Today, I went to RMIT with my friend Linh, we learned a lot IOS stuff from Fardin. what a good day!")], user: User(nickName: "God Father", birthDay: "3-Dec-1993", password: "0000", hint: "the initial password is '0000'"))

    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func button1(_ sender: Any) {
        passwordTextField.insertText("1")
    }
    @IBAction func button2(_ sender: Any) {
        passwordTextField.insertText("2")
    }
    @IBAction func button3(_ sender: Any) {
        passwordTextField.insertText("3")
    }
    @IBAction func button4(_ sender: Any) {
        passwordTextField.insertText("4")
    }
    @IBAction func button5(_ sender: Any) {
        passwordTextField.insertText("5")
    }
    @IBAction func button6(_ sender: Any) {
        passwordTextField.insertText("6")
    }
    @IBAction func button7(_ sender: Any) {
        passwordTextField.insertText("7")
    }
    @IBAction func button8(_ sender: Any) {
        passwordTextField.insertText("8")
    }
    @IBAction func button9(_ sender: Any) {
        passwordTextField.insertText("9")
    }
    @IBAction func button0(_ sender: Any) {
        passwordTextField.insertText("0")
    }

    @IBOutlet weak var hintLabel: UILabel!

    @IBAction func hintButton(_ sender: Any) {
        hintLabel.text = appEngine.user.hint
        hintLabel.isHidden = !hintLabel.isHidden
    }

    @IBAction func confirmPasswordButton(_ sender: Any) {
        if passwordTextField.text != appEngine.user.password {
            let alert = UIAlertController(title: "wrong password", message: " ", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {Void in})
            alert.addAction(okAction)
            alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor : UIColor.red]), forKey: "attributedTitle")
            present(alert, animated: true, completion: nil)
            passwordTextField.text = ""
        } else {
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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwordTextField.isSecureTextEntry = true
    }
}
