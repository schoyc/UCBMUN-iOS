//
//  LoginViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 12/24/15.
//  Copyright © 2015 Steven Chen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    
    let loginSuccessSegue = "LoginToHome"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if let user = PFUser.currentUser() {
            if user.authenticated {
                print("WHAT IS GOING ON")
                performSegueWithIdentifier("LoginToHome", sender: nil)
                print("WHY YOU DO DIS")
            }
            
        } else {
            print("NOT AUTHENTICATED")
        }
    }
    
    //MARK: - Actions
    
    
    @IBAction func loginPressed(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(nameTextField.text!, password: passwordTextField.text!) { user, error in
            if user != nil {
                self.performSegueWithIdentifier(self.loginSuccessSegue, sender: nil)
            } else {
                print("Error with logging in")
            }
        }
    }
    
    
    @IBAction func signupPressed(sender: AnyObject) {
        performSegueWithIdentifier("LoginToSignup", sender: nil)
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
