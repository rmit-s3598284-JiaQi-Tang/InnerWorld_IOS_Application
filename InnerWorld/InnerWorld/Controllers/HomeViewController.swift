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
        // Do any additional setup after loading the view, typically from a nib.
        let diary1 = Diary(tittle: "A happy day in St Kilda", date: "08-Aug-2018", mood: "smile", weather: "sunny", location: "St Kilda, Melbourne", photo: "prototype-diaryPicture", content: "Today, I went to St kilda beach with my Indian brother Manana. We took a lot of awesome pictures there! what a happy day!")
        let diary2  = Diary(tittle: "Lost 100$ in China Town", date: "6-Aug-2018", mood: "cry", weather: "rainning", location: "China Town, Melbourne", photo: "prototype-diaryPicture2", content: "Today, I went to China Town alone for some Chinese food. I lost my precious 100$! what a bad day!")
        let diary3  = Diary(tittle: "Learning Swift is fun!", date: "1-Aug-2018", mood: "happy", weather: "cloud", location: "RMIT, Melbourne", photo: "prototype-diaryPicture3", content: "Today, I went to RMIT with my friend Linh, we learned a lot IOS stuff from Fardin. what a good day!")
        appEngine.diaryList = [diary1, diary2, diary3]
        appEngine.user = User(nickName: "God Father", birthDay: "3-Dec-1993", password: "0000", hint: "my cat's birth day")
    }

    @IBOutlet weak var diaryTableView: UITableView!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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
//        self.tabBarController?.pushViewController(viewController!, animated: true)
        present(viewController!, animated: true, completion: nil)
    }
}

