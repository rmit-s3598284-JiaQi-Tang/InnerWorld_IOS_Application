//
//  ReadViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 27/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class ReadViewController: UIViewController {

    @IBOutlet var operatingButtons: [UIButton]!
    @IBAction func handelSelection(_ sender: UIButton) {
        operatingButtons.forEach { (button) in
            button.isHidden = !button.isHidden
        }
    }
    @IBAction func operatingTapped(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func deleteButton(_ sender: Any) {
        let alert = UIAlertController(title: "are you sure to delete this diary? ", message: " ", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: {Void in})
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {Void in})
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
