//
//  HomeTableViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 2/13/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import UIKit

class HomePageTableViewController: PFQueryTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let testData = UIImageJPEGRepresentation(UIImage(named: "wsf.png")!, 0.9)
// 
//        let testFile = PFFile(name: "test", data: testData!)
//        let testPost = NewsPost(image: testFile!, text: "UCBMUN!!!", priority: 0)
//
//        testPost.saveInBackground()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewWillAppear(animated: Bool) {
        loadObjects()
    }
    
    override func queryForTable() -> PFQuery {
        let query = NewsPost.query()
        return query!
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsPostCell", forIndexPath: indexPath) as! NewsPostTableViewCell
        let post = object as! NewsPost
        
        cell.newsImage.file = post.image!
        //cell.newsImage.loadInBackground()
        cell.newsImage.loadInBackground(nil) { percent in
            cell.progressLoading.progress = Float(percent)*0.01
            print("\(percent)%")
        }
        
        let creationDate = post.createdAt
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEE, MMM d"
        let dateString = dateFormatter.stringFromDate(creationDate!)
        
        cell.newsText.text = post.text
        cell.newsDate.text = dateString
        return cell
    }



}
