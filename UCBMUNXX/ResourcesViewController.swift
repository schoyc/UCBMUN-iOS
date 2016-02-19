//
//  SecondViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 12/24/15.
//  Copyright © 2015 Steven Chen. All rights reserved.
//

import UIKit

class ResourcesViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func rulesClicked(sender: AnyObject) {
        
        performSegueWithIdentifier("fromResourcesToRules", sender: nil)
    }
    
    @IBAction func handbookClicked(sender: AnyObject) {
        performSegueWithIdentifier("fromResourcesToHandbook", sender: nil)
    }
    
    @IBAction func mapClicked(sender: AnyObject) {
        performSegueWithIdentifier("fromResourcesToHotelMap", sender: nil)
    }
    
    @IBAction func contactClicked(sender: AnyObject) {
        performSegueWithIdentifier("fromResourcesToContacts", sender: nil)
    }
    
    @IBAction func scheduleClicked(sender: AnyObject) {
        performSegueWithIdentifier("fromResourcesToSchedule", sender: nil)
    }
    
    
    @IBAction func committeesClicked(sender: AnyObject) {
        performSegueWithIdentifier("fromResourcesToCommittees", sender: nil)
    }
    
  

}

