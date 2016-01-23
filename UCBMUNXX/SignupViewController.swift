//
//  SignupViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 12/24/15.
//  Copyright © 2015 Steven Chen. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var characterName: UITextField!
    
    @IBOutlet weak var universityPicker: UIPickerView!
    
    var university : String?

    
    var pickerData = ["Univ. of California, Berkeley", "Univ. of MUN"]
    
    let signupSuccessSegue = "SignupToMain"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.universityPicker.dataSource = self;
        self.universityPicker.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupPressed(sender: AnyObject) {
        let user = PFUser()
        
        user.username = characterName.text
        user.email = emailTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackgroundWithBlock { succeeded, error in
            if (succeeded) {
                //The registration was successful, go to the wall
                self.performSegueWithIdentifier(self.signupSuccessSegue, sender: nil)
            } else {
                //Something bad has occurred
                print("ERROR WITH SIGNUP")
                
            }
        }
        
        user.setObject(nameTextField.text!, forKey: "name")
        user.setObject(self.university!, forKey: "university")
        
        user.saveInBackground()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.university = pickerData[row]
    }


}
