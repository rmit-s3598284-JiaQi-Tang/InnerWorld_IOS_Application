//
//  PasswordViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 26/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

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
        hintLabel.isHidden = !hintLabel.isHidden
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwordTextField.isSecureTextEntry = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
