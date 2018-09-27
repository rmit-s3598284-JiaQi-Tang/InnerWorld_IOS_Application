//
//  Create_Content_ViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 26/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class Create_Content_ViewController: UIViewController {

//    var appEngine = AppEngine.shared()
    var model = Model.shared()
    var edittingDiray = Diary()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBOutlet weak var tittleTextField: UITextField!
    @IBOutlet weak var contentUITextView: UITextView!

    @IBAction func tickButtonTapped(_ sender: Any) {
        model.creatingDiary.title = tittleTextField.text!
        model.creatingDiary.content = contentUITextView.text
        model.addDiaryToCoreData()
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
