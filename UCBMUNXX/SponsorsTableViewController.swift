//
//  SponsorsTableViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 2/20/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import UIKit

class SponsorsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    let sponsors = ["magoosh.jpg", "lufthansa.jpg", "setonhall.jpg", "fletcher.jpg", "newengland.jpg", "sage.jpg"
    ]
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("sponsorCell", forIndexPath: indexPath) as! SponsorCell
        let sponsorImage = self.sponsors[indexPath.row]
        
        cell.sponsorImage.image = UIImage(named: sponsorImage)
        
        return cell
    }

    
    
}
