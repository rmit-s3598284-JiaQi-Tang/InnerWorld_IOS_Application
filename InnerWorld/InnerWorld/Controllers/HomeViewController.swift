//
//  FirstViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 23/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var appEngine = AppEngine()

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = self.tabBarController as! MyTabBarViewController
        appEngine = vc.appEngine
    }
//    override func viewDidAppear(_ animated: Bool) {
//        let vc = self.tabBarController as! MyTabBarViewController
//        appEngine = vc.appEngine
//    }
//    override func viewDidDisappear(_ animated: Bool) {
//        let vc = self.tabBarController as! MyTabBarViewController
//        vc.appEngine = appEngine
//    }

    @IBOutlet weak var diaryTableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(appEngine.diaryList.count)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeViewControllerTableViewCell
        cell.locationLabel.text = appEngine.diaryList[indexPath.row].location
        cell.weatherIcon.image = UIImage(named: (appEngine.diaryList[indexPath.row].weather + ".png"))
        cell.tittleLabel.text = appEngine.diaryList[indexPath.row].tittle
        cell.dateLabel.text = appEngine.diaryList[indexPath.row].date
        return(cell)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(140)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ReadViewController") as? ReadViewController
        viewController?.diary = appEngine.diaryList[indexPath.row]
        viewController?.appEngine = appEngine
        present(viewController!, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }

    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.appEngine.diaryList.remove(at: indexPath.row)
            self.diaryTableView.deleteRows(at: [indexPath], with: .automatic)
            
            completion(true)
        }
//        let deleteImage = UIImage(named: "delete.png")
        action.image = #imageLiteral(resourceName: "trashBin")
        action.backgroundColor = .red
        return action
    }
}

