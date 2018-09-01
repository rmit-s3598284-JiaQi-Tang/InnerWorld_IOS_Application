//
//  tabBarViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 31/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController {

    var appEngine = AppEngine(diaryList: [Diary(tittle: "A happy day in St Kilda", date: "08-Aug-2018", mood: "smile", weather: "sunny", location: "St Kilda, Melbourne", photo: "prototype-diaryPicture", content: "Today, I went to St kilda beach with my Indian brother Manana. We took a lot of awesome pictures there! what a happy day!"),Diary(tittle: "Lost 100$ in China Town", date: "6-Aug-2018", mood: "cry", weather: "rainning", location: "China Town, Melbourne", photo: "prototype-diaryPicture2", content: "Today, I went to China Town alone for some Chinese food. I lost my precious 100$! what a bad day!"),Diary(tittle: "Learning Swift is fun!", date: "1-Aug-2018", mood: "happy", weather: "cloud", location: "RMIT, Melbourne", photo: "prototype-diaryPicture3", content: "Today, I went to RMIT with my friend Linh, we learned a lot IOS stuff from Fardin. what a good day!")], user: User(nickName: "God Father", birthDay: "3-Dec-1993", password: "0000", hint: "my cat's birth day"))

    override func viewDidLoad() {
        super.viewDidLoad()
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
