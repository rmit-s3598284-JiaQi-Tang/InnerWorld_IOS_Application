//
//  Create_Content_ViewController.swift
//  InnerWorld
//
//  Created by Jacky Tang on 26/8/18.
//  Copyright © 2018 Jacky Tang. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MobileCoreServices

class Create_Content_ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var model = Model.shared()
    var edittingDiray = Diary()
    
    var avPlayerViewController: AVPlayerViewController!
    var image: UIImage?
    var movieURL: URL?
    var lastChosenMediaType: String?

    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        {
            takePhotoButton.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBOutlet weak var tittleTextField: UITextField!
    @IBOutlet weak var contentUITextView: UITextView!

    @IBAction func tickButtonTapped(_ sender: Any) {
        model.creatingDiary.title = tittleTextField.text!
        model.creatingDiary.content = contentUITextView.text
        model.addDiaryToCoreData()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        pickMediaFromSource (UIImagePickerControllerSourceType.camera)
    }
    
    
    @IBAction func accessLibrary(_ sender: Any) {
        pickMediaFromSource (UIImagePickerControllerSourceType.photoLibrary)
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
                model.creatingDiary.image = image
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
                imageView.image = image!
                imageView.isHidden = false
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
                    avPlayerView?.frame = imageView.frame
                    avPlayerView?.clipsToBounds = true
                    view.addSubview(avPlayerView!)
                }
                if let url = movieURL
                {
                    imageView.isHidden = true
                    avPlayerViewController.player = AVPlayer(url: url)
                    avPlayerViewController!.view.isHidden = false
                    avPlayerViewController!.player!.play()
                }
            }
        }
    }
}
