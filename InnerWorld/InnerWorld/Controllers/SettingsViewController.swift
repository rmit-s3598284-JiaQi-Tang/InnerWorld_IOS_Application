//
//  SettingsViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 23/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var appEngine = AppEngine.shared()
    
    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldHint: UITextField!
    @IBOutlet weak var datePickerBirthday: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldUserName.text = appEngine.user.nickName
        textFieldPassword.text = appEngine.user.password
        textFieldHint.text = appEngine.user.hint
    }

    override func viewDidDisappear(_ animated: Bool) {
        //update the changes of appEngine
    }
    @IBAction func btnSaveClicked(_ sender: Any) {

        let user = User(nickName: textFieldUserName.text!, birthDay: "Sample date", password: textFieldPassword.text!, hint: textFieldHint.text!)
        appEngine.saveUser(user: user)

        let alert = UIAlertController(title: "New settings has been saved", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {Void in})
        alert.addAction(okAction)
        alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor : UIColor.black]), forKey: "attributedTitle")
        self.present(alert, animated: true, completion: nil)

    }

    @IBAction func showButtonTapped(_ sender: Any) {
        textFieldPassword.isSecureTextEntry = !textFieldPassword.isSecureTextEntry
    }
}
