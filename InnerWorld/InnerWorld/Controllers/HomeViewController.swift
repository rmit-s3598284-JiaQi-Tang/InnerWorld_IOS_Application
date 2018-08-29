//
//  FirstViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 23/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let listOfTittle = ["A happy day in St Kilda beach", "Lost 100$ in China Town", "Learning Swift is fun!"]
    let listOfLocation = ["St Kilda, Melbourne", "China Town, Melbourne", "RMIT, Melbourne"]
    let listOfWeatherIcon = ["sunny", "heavy rain", "cloud"]
    let listOfDate = ["8-Aug-2018", "6-Aug-2018", "1-Aug-2018"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(listOfTittle.count)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeViewControllerTableViewCell
        cell.locationLabel.text = listOfLocation[indexPath.row]
        cell.weatherIcon.image = UIImage(named: (listOfWeatherIcon[indexPath.row] + ".png"))
        cell.tittleLabel.text = listOfTittle[indexPath.row]
        cell.dateLabel.text = listOfDate[indexPath.row]
        return(cell)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(140)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

