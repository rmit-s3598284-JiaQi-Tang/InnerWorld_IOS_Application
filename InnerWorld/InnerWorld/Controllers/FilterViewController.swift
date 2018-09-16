//
//  FilterViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 26/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var appEngine = AppEngine.shared()
    let happyData = UIImagePNGRepresentation(#imageLiteral(resourceName: "happy"))
    let sadData = UIImagePNGRepresentation(#imageLiteral(resourceName: "sad"))
    let smileData = UIImagePNGRepresentation(#imageLiteral(resourceName: "smile"))
    let cryData = UIImagePNGRepresentation(#imageLiteral(resourceName: "cry"))

    @IBOutlet weak var backFaceImage: UIImageView!
    @IBOutlet weak var leftFaceImage: UIImageView!
    @IBOutlet weak var rightFaceImage: UIImageView!
    @IBOutlet weak var midFaceImage: UIImageView!
    @IBOutlet weak var locationPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightFaceImage.image = #imageLiteral(resourceName: "sad")
        leftFaceImage.image = #imageLiteral(resourceName: "smile")
        midFaceImage.image = #imageLiteral(resourceName: "happy")
        backFaceImage.image = #imageLiteral(resourceName: "cry")
        
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return appEngine.diaryLocations.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return appEngine.diaryLocations[row]
    }
    
    @IBAction func leftButton(_ sender: Any) {
        let midImageData = UIImagePNGRepresentation(midFaceImage.image!)
        if midImageData == happyData {
            midFaceImage.image = #imageLiteral(resourceName: "smile")
            leftFaceImage.image = #imageLiteral(resourceName: "happy")
            rightFaceImage.image = #imageLiteral(resourceName: "cry")
            backFaceImage.image = #imageLiteral(resourceName: "sad")
        }
        if midImageData == sadData {
            midFaceImage.image = #imageLiteral(resourceName: "happy")
            rightFaceImage.image = #imageLiteral(resourceName: "smile")
            leftFaceImage.image = #imageLiteral(resourceName: "sad")
            backFaceImage.image = #imageLiteral(resourceName: "cry")
        }
        if midImageData == smileData {
            midFaceImage.image = #imageLiteral(resourceName: "cry")
            rightFaceImage.image = #imageLiteral(resourceName: "sad")
            leftFaceImage.image = #imageLiteral(resourceName: "smile")
            backFaceImage.image = #imageLiteral(resourceName: "happy")
        }
        if midImageData == cryData {
            midFaceImage.image = #imageLiteral(resourceName: "sad")
            rightFaceImage.image = #imageLiteral(resourceName: "happy")
            leftFaceImage.image = #imageLiteral(resourceName: "cry")
            backFaceImage.image = #imageLiteral(resourceName: "smile")
        }

    }

    @IBAction func rightButton(_ sender: Any) {
        let midImageData = UIImagePNGRepresentation(midFaceImage.image!)
        if midImageData == happyData {
            midFaceImage.image = #imageLiteral(resourceName: "sad")
            leftFaceImage.image = #imageLiteral(resourceName: "cry")
            rightFaceImage.image = #imageLiteral(resourceName: "happy")
            backFaceImage.image = #imageLiteral(resourceName: "smile")
        }
        if midImageData == sadData {
            midFaceImage.image = #imageLiteral(resourceName: "cry")
            rightFaceImage.image = #imageLiteral(resourceName: "sad")
            leftFaceImage.image = #imageLiteral(resourceName: "smile")
            backFaceImage.image = #imageLiteral(resourceName: "happy")
        }
        if midImageData == smileData {
            midFaceImage.image = #imageLiteral(resourceName: "happy")
            rightFaceImage.image = #imageLiteral(resourceName: "smile")
            leftFaceImage.image = #imageLiteral(resourceName: "sad")
            backFaceImage.image = #imageLiteral(resourceName: "cry")
        }
        if midImageData == cryData {
            midFaceImage.image = #imageLiteral(resourceName: "smile")
            rightFaceImage.image = #imageLiteral(resourceName: "cry")
            leftFaceImage.image = #imageLiteral(resourceName: "happy")
            backFaceImage.image = #imageLiteral(resourceName: "sad")
        }
    }

    @IBAction func filterButtonTapped(_ sender: Any) {
        var mood = "happy"
        switch midFaceImage.image! {
        case #imageLiteral(resourceName: "happy"):
            mood = "happy"
        case #imageLiteral(resourceName: "smile"):
            mood = "smile"
        case #imageLiteral(resourceName: "sad"):
            mood = "sad"
        case #imageLiteral(resourceName: "cry"):
            mood = "cry"
        default:
            break;
        }
        let location = appEngine.diaryLocations[locationPicker.selectedRow(inComponent: 0)]
        appEngine.filterHomePageDiaryList(search: "", location: location, mood: mood)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
