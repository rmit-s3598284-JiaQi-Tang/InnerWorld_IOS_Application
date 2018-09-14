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
    }
}
