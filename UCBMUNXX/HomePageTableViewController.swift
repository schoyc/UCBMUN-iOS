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
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.204, green:0.286, blue:0.369, alpha:1)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        
        let logo = UIImage(named: "logo_orange.png")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .ScaleAspectFit
        imageView.image = logo
        self.navigationItem.titleView = imageView
        
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
        
        cell.newsHeadline.text = post.headline
        cell.newsText.text = post.text
        cell.newsDate.text = dateString
        return cell
    }
    
        
    /*
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 20
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.layer.backgroundColor = UIColor(red:0.937, green:0.937, blue:0.937, alpha:1).CGColor
        return v
    } */

    /*
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.contentView.backgroundColor = UIColor.clearColor()
        
        let whiteRoundedView : UIView = UIView(frame: CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height))
        
        whiteRoundedView.layer.backgroundColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 1.0, 1.0, 1.0])
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 2.0
        whiteRoundedView.layer.shadowOffset = CGSizeMake(-1, 1)
        whiteRoundedView.layer.shadowOpacity = 0.2
        
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubviewToBack(whiteRoundedView)
    } */
    
    
    @IBAction func logOutClicked(sender: AnyObject) {
        
        PFUser.logOut()
        self.performSegueWithIdentifier("HomeToLogin", sender: nil)
    }



}
