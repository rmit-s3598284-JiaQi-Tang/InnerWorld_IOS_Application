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
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var currentWeather: UIImageView!
    @IBOutlet weak var clearFilterButton: UIButton!
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.refreshDiaryData()
    }

    func refreshDiaryData(){
        appEngine.filterHomePageDiaryList(search: searchBar.text!, location: "", mood: "")
        self.diaryTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.diaryTableView.reloadData()
        currentLocation.text = appEngine.currentLocation
        currentWeather.image = UIImage(named: appEngine.currentWeather + ".png")
    }

    override func viewWillAppear(_ animated: Bool) {
        self.diaryTableView.reloadData()
    }

    @IBOutlet weak var diaryTableView: UITableView!

    @IBAction func clearFilterButtonTapped(_ sender: Any) {
        appEngine.filterHomePageDiaryList(search: "", location: "", mood: "")
        self.diaryTableView.reloadData()
        clearFilterButton.isHidden = true
    }
    
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
        present(viewController!, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }

    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.appEngine.removeDiary(tittleOfToBeDeletedDiary: self.appEngine.diaryList[indexPath.row].title)
            self.appEngine.filteredDiaryList.remove(at: indexPath.row)
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
        clearFilterButton.isHidden = false
    }
}

