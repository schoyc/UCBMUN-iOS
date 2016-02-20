//
//  SecondViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 12/24/15.
//  Copyright © 2015 Steven Chen. All rights reserved.
//

import UIKit

class ResourcesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let identifier = "resourceCell"
    
    let resources = [
        ["Schedule", "schedule.png", "fromResourcesToSchedule"],
        ["Committees", "committees.png", "fromResourcesToCommittees"],
        ["Programming", "programming.png", "fromResourcesToProgramming"],
        ["Hotel Map", "hotel.png", "fromResourcesToHotelMap"],
        ["Sponsors", "sponsors.png", "fromResourcesToSponsors"],
        ["Contact Us", "contact.png", "fromResourcesToContacts"],
        ["Delegate Handbook", "handbook.png", "fromResourcesToHandbook"],
        ["Rules & Procedures", "rules.png", "fromResourcesToRules"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.resources.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! ResourceCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        let resource = self.resources[indexPath.item]

        cell.resourceLabel.text = resource[0]
        cell.resourceIcon.image = UIImage(named: resource[1])
        //cell.backgroundColor = UIColor.yellowColor() // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        let resource = self.resources[indexPath.item]
        performSegueWithIdentifier(resource[2], sender: nil)
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

