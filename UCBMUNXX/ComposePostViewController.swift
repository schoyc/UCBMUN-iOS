//
//  ComposePostViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 12/24/15.
//  Copyright © 2015 Steven Chen. All rights reserved.
//

import UIKit

class ComposePostViewController: UIViewController {
    
    
    //Attributes 
    
//    @IBOutlet weak var imagePreview: UIImageView!
//    @IBOutlet weak var captionTextField: UITextView!
//    
//    @IBOutlet weak var imageLoadingSpinner: UIActivityIndicatorView!

    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var captionTextField: UITextView!
    @IBOutlet weak var imageLoadingSpinner: UIActivityIndicatorView!
    
    private var postToReply : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.postToReply!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setPostToReply(postId: String) {
        self.postToReply = postId
    }
    
    @IBAction func backPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func uploadPhotoPressed(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func takePhotoPressed(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    
    @IBAction func postPressed(sender: AnyObject) {
        captionTextField.resignFirstResponder()
        
        
        navigationItem.rightBarButtonItem?.enabled = false
        
        imageLoadingSpinner.startAnimating()
        
        let imageData = UIImageJPEGRepresentation(imagePreview.image!, 0.9)
        let file = PFFile(name: "image", data: imageData!)
        file?.saveInBackgroundWithBlock({ (succeeded, error) -> Void in
            if succeeded {
                print("FILE SAVE SUCCEEDED")
                self.savePost(file!)
            } else if let error = error {
                print("THERE WAS AN ERROR IN UPLOADING YOUR POST")
                print(error)
            }
            }, progressBlock: { percent in
                print("Uploaded: \(percent)%")
        })
    }
    
    
    func savePost(file: PFFile)
    {
        let post = MUNChatPost(parentPostId: postToReply!, image: file, user: PFUser.currentUser()!, username: PFUser.currentUser()!.objectForKey("username") as? String, text: self.captionTextField.text, score: 0, flag: "None")
        
        post.saveInBackgroundWithBlock{succeeded, error in
            if succeeded {
                
                print("REPLY SUCCEEDED")
                self.dismissViewControllerAnimated(true, completion: nil);
                print("TRANSITION WORKING?")
            } else {
                print("ERROR")
            }
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ComposePostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        //Place the image in the imageview
        imagePreview.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}
