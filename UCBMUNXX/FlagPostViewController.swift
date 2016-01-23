//
//  FlagPostViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 12/29/15.
//  Copyright © 2015 Steven Chen. All rights reserved.
//

import UIKit

class FlagPostViewController: UIViewController {
    
    private var flaggedPost : MUNChatPost
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("Flag Post View rendering")
        self.flaggedPost = MUNChatPost()
        super.init(coder: aDecoder)
        
    }
    
    deinit {
        print("deinit FlagPostViewController")
    }
    
    func setFlagPost(flaggedPost : MUNChatPost) {
        self.flaggedPost = flaggedPost
    }
    
    @IBAction func inappropriateSelected(sender: AnyObject) {
        flaggedPost.flag = "Inappropriate Content"
        flaggedPost.saveInBackground()
        self.dismissViewControllerAnimated(true, completion: nil)
        //self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func rudeHurtfulSelected(sender: AnyObject) {
        flaggedPost.flag = "Rude/Hurtful"
        flaggedPost.saveInBackground()
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func spamSelected(sender: AnyObject) {
        flaggedPost.flag = "Spam"
        flaggedPost.saveInBackground()
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func otherSelected(sender: AnyObject) {
        flaggedPost.flag = "Other"
        flaggedPost.saveInBackground()
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
        
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
