//
//  EditViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 4/9/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MobileCoreServices

class EditViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var model = Model.shared()
    var diary: Diary_CD!
    
    var avPlayerViewController: AVPlayerViewController!
    var image: UIImage?
    var movieURL: URL?
    var lastChosenMediaType: String?

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var locationOfEditScreen: UILabel!
    @IBOutlet weak var tittleOfEditScreen: UITextField!
    @IBOutlet weak var weatherOfEditScreen: UIButton!
    @IBOutlet weak var moodOfEditScreen: UIButton!
    @IBOutlet weak var contentOfEditScreen: UITextView!
    @IBOutlet weak var moodStackView: UIStackView!
    @IBAction func moodButtonTapped(_ sender: Any) {
        moodStackView.isHidden = !moodStackView.isHidden
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateDisplay()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        diary = model.readingDiary
        // Do any additional setup after loading the view.
        tittleOfEditScreen.text = diary.title
//please make date to type of String
//        dateLabel.text = diary.date

        locationOfEditScreen.text = diary.location

        weatherOfEditScreen.setImage(UIImage(named: (diary.weather! + ".png")), for: .normal)
        weatherOfEditScreen.accessibilityIdentifier = diary.weather

        moodOfEditScreen.setImage(UIImage(named: (diary.mood! + ".png")), for: .normal)
        moodOfEditScreen.accessibilityIdentifier = diary.mood

        contentOfEditScreen.text = diary.content
        moodStackView.isHidden = true
        if (diary.photo != "") {
            image = diary.getUiImage()
            imageButton.setImage(image, for: UIControlState.normal)
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pictureTapped(_ sender: Any) {
        pickMediaFromSource (UIImagePickerControllerSourceType.photoLibrary)
    }
    
    @IBAction func tickButtonTapped(_ sender: Any) {
        diary.title = tittleOfEditScreen.text!
//please make date to type of String
//        diary.date = dateLabel.text!

        diary.location = locationOfEditScreen.text!
        diary.content = contentOfEditScreen.text!
        if let newWeather = weatherOfEditScreen.accessibilityIdentifier {
            diary.weather = newWeather
        }
        if let newMood = moodOfEditScreen.accessibilityIdentifier {
            diary.mood = newMood
        }
        let newDiary = Diary(diary: diary)
        newDiary.image = image
        model.saveDiaryToCoreData(diary: newDiary, existing: model.readingDiary)
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func smileButtonTapped(_ sender: Any) {
        moodOfEditScreen.setImage(UIImage(named: "smile.png"), for: .normal)
        moodOfEditScreen.accessibilityIdentifier = "smile"
        moodStackView.isHidden = true
    }
    @IBAction func happyButtonTapped(_ sender: Any) {
        moodOfEditScreen.setImage(UIImage(named: "happy.png"), for: .normal)
        moodOfEditScreen.accessibilityIdentifier = "happy"
        moodStackView.isHidden = true
    }
    @IBAction func sadButtonTapped(_ sender: Any) {
        moodOfEditScreen.setImage(UIImage(named: "sad.png"), for: .normal)
        moodOfEditScreen.accessibilityIdentifier = "sad"
        moodStackView.isHidden = true
    }
    @IBAction func cryButtonTapped(_ sender: Any) {
        moodOfEditScreen.setImage(UIImage(named: "cry.png"), for: .normal)
        moodOfEditScreen.accessibilityIdentifier = "cry"
        moodStackView.isHidden = true
    }
    
    func pickMediaFromSource (_ sourceType: UIImagePickerControllerSourceType)
    {
        // What media types are available on the device
        let mediaTypes = UIImagePickerController.availableMediaTypes(for: sourceType)!
        if UIImagePickerController.isSourceTypeAvailable(sourceType) && mediaTypes.count > 0
        {
            let picker = UIImagePickerController()
            // Display the media types avaialble on the picker
            picker.mediaTypes = mediaTypes
            // Set delegate to self for system method calls.
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = sourceType
            // Present the picker to the user.
            present(picker, animated: true , completion: nil)
        }
        else    // Otherwise display an error message
        {
            let alertController = UIAlertController (title: "Error accessing media", message: "Unsupported media source.",
                                                     preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction (title: "OK", style: UIAlertActionStyle.cancel , handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        lastChosenMediaType = info[UIImagePickerControllerMediaType] as? String // Set the variable to the data retrieved.
        if let mediaType = lastChosenMediaType
        {
            if mediaType == (kUTTypeImage as NSString) as String
            {
                image = info[UIImagePickerControllerEditedImage] as? UIImage
            }
            else if mediaType == (kUTTypeMovie as NSString) as String
            {
                movieURL = info[UIImagePickerControllerMediaURL] as? URL
            }
        } // Dismiss the picker to return to the apps view
        picker.dismiss(animated: true, completion: nil)
    }
    
    func updateDisplay()
    {
        // optional, so if let used to unwrap.
        if let mediaType = lastChosenMediaType
        {
            // if the media chosen is an image, then get the image and display it.
            if mediaType == (kUTTypeImage as NSString) as String
            {
                imageButton.setImage(image, for: UIControlState.normal)
                if avPlayerViewController != nil
                {
                    avPlayerViewController!.view.isHidden = true
                }
                // Otherwise the media chosen is a video
            }
            else if mediaType == (kUTTypeMovie as NSString) as String
            {
                if avPlayerViewController == nil
                {
                    // Instantiate a view for displaying the video
                    avPlayerViewController = AVPlayerViewController()
                    let avPlayerView = avPlayerViewController!.view
                    avPlayerView?.frame = imageButton.frame
                    avPlayerView?.clipsToBounds = true
                    view.addSubview(avPlayerView!)
                }
                if let url = movieURL
                {
                    imageButton.isHidden = true
                    avPlayerViewController.player = AVPlayer(url: url)
                    avPlayerViewController!.view.isHidden = false
                    avPlayerViewController!.player!.play()
                }
            }
        }
    }

}
