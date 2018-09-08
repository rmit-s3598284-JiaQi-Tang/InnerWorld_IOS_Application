//
//  Create_Content_ViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 26/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class Create_Content_ViewController: UIViewController {

    var appEngine = AppEngine.shared()
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
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let myTabBarViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MyTabBarViewController") as? MyTabBarViewController else{
            return
        }
        edittingDiray.tittle = tittleTextField.text!
        edittingDiray.content = contentUITextView.text
        appEngine.diaryList.append(edittingDiray)
        present(myTabBarViewController, animated: true, completion: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "Create_Mood_View_Controller") as? Create_Mood_ViewController
        present(viewController!, animated: true, completion: nil)
    }
}
