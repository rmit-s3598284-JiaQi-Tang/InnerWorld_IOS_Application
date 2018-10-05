//
//  SettingsViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 23/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var model = Model.shared()
    
    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldHint: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldUserName.text = model.user.nickName
        textFieldPassword.text = model.user.password
        textFieldHint.text = model.user.hint
    }
    
    @IBAction func btnSaveClicked(_ sender: Any) {
        model.saveUser(nickname: textFieldUserName.text!, password: textFieldPassword.text!, hint: textFieldHint.text!)
        
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
