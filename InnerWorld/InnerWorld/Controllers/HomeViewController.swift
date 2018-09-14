//
//  FirstViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 23/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var appEngine = AppEngine.shared()

    @IBOutlet weak var searchBar: UISearchBar!
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.refreshDiaryData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    func refreshDiaryData(){
        appEngine.filterHomePageDiaryList(search: searchBar.text!)
        self.diaryTableView.reloadData()
    }
    
    @IBOutlet weak var diaryTableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(appEngine.filteredDiaryList.count)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeViewControllerTableViewCell
        cell.locationLabel.text = appEngine.filteredDiaryList[indexPath.row].location
        cell.weatherIcon.image = UIImage(named: (appEngine.filteredDiaryList[indexPath.row].weather + ".png"))
        cell.tittleLabel.text = appEngine.filteredDiaryList[indexPath.row].title
        cell.dateLabel.text = appEngine.filteredDiaryList[indexPath.row].date
        return(cell)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(165)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ReadViewController") as? ReadViewController
        viewController?.diary = appEngine.filteredDiaryList[indexPath.row]
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

            let alert = UIAlertController(title: "The diary has been deleted", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {Void in})
            alert.addAction(okAction)
            alert.setValue(NSAttributedString(string: alert.title!, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor : UIColor.red]), forKey: "attributedTitle")
            self.present(alert, animated: true, completion: nil)
        }

        action.image = #imageLiteral(resourceName: "trashBin")
        action.backgroundColor = .red
        return action
    }

    @IBAction func filterButtonTapped(_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as? FilterViewController
        present(viewController!, animated: true, completion: nil)
    }
}

