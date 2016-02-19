//
//  MUNChatTableViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 12/25/15.
//  Copyright © 2015 Steven Chen. All rights reserved.
//

import UIKit

class MUNChatTableViewController: PFQueryTableViewController {
    
    let composePostSegue = "MUNChatToComposePost"
    
    
    @IBOutlet weak var recentOrPopularControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        //recentOrPopularControl.addTarget(self, action: "recentOrPopularChanged", forControlEvents: .ValueChanged)
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
        switch recentOrPopularControl.selectedSegmentIndex {
            case 0:
                let query = MUNChatPost.query()
                return query!
            case 1:
                let query = MUNChatPost.queryPopularPosts()
                return query!
            default:
                let query = MUNChatPost.query()
                return query!
        }
        
    }
    
    
    func recentOrPopularChanged() {
        //self.tableView.reloadData()
        loadObjects()
        //print(recentOrPopularControl.selectedSegmentIndex)
        
    }
    
    @IBAction func segmentedControlAction(sender: AnyObject) {
        loadObjects()
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as! MUNChatTableViewCell
        let post = object as! MUNChatPost
        
        cell.postImage.file = post.image!
        cell.postImage.loadInBackground(nil) { percent in
            cell.postLoading.progress = Float(percent)*0.01
            print("\(percent)%")
        }
        
        
        let creationDate = post.createdAt
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "h:mm a, EEE"
        let dateString = dateFormatter.stringFromDate(creationDate!)
        
        cell.postUser.text = post.user.username
        cell.postTime.text = dateString
        //cell.postScore.text = post.score.toString()
        
//        if let username = post.user.username {
//            cell.postUser.text = "Uploaded by: \(username), \(dateString)"
//        } else {
//            cell.createdByLabel.text = "Uploaded by anonymous: , \(dateString)"
//        }
        
        //cell.createdByLabel.text = "Uploaded by: \(wallPost.user.username), \(dateString)"
        
        cell.postText.text = post.text
        cell.postScore.text = String(post.score)
        if let hasUpVote = post.votes[PFUser.currentUser()!.objectId!] {
            if hasUpVote {
                cell.upVoteButton.backgroundColor = UIColor.blueColor()
                cell.downVoteButton.backgroundColor = UIColor.clearColor()
            } else {
                cell.downVoteButton.backgroundColor = UIColor.blueColor()
                cell.upVoteButton.backgroundColor = UIColor.clearColor()
            }
        } else {
            cell.upVoteButton.backgroundColor = UIColor.clearColor()
            cell.downVoteButton.backgroundColor = UIColor.clearColor()
        }
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
            case "MUNChatToPostReplies":
                let tapPoint = sender!.convertPoint(CGPointZero, toView: self.tableView)
                let tapIndex = self.tableView.indexPathForRowAtPoint(tapPoint)
                let post = objectAtIndexPath(tapIndex) as! MUNChatPost
                
                let repliesVC = segue.destinationViewController as! MUNChatRepliesTableViewController
                repliesVC.setParentPost(post.objectId!)
            case self.composePostSegue:
                let composePostVC = segue.destinationViewController as! ComposePostViewController
                composePostVC.setPostToReply("")
            case "MUNChatToFlagPost":
                let tapPoint = sender!.convertPoint(CGPointZero, toView: self.tableView)
                let tapIndex = self.tableView.indexPathForRowAtPoint(tapPoint)
                let post = objectAtIndexPath(tapIndex) as! MUNChatPost
                
                let flagVC = segue.destinationViewController as! FlagPostViewController
                flagVC.setFlagPost(post)
        default:
            print("No segue prep")
            
            
        }

    }
    
    
    // MARK: Buttons
    
    @IBAction func upVotePressed(sender: AnyObject) {
        let tapPoint = sender.convertPoint(CGPointZero, toView: self.tableView)
        let tapIndex = self.tableView.indexPathForRowAtPoint(tapPoint)
        let post = objectAtIndexPath(tapIndex) as! MUNChatPost
        let currentUserId = PFUser.currentUser()!.objectId!
        
        //No votes pressed
        //Upvote already pressed
        //Downvote already pressed
        
        if let isUpVote = post.votes[currentUserId] {
            if !isUpVote {
                post.incrementKey("score", byAmount: 2)
                post.votes[currentUserId] = true
                post.saveInBackground()
                self.tableView.reloadData()
            } else {
                post.incrementKey("score", byAmount: -1)
                post.votes.removeValueForKey(currentUserId)
                post.saveInBackground()
                self.tableView.reloadData()
            }
            
    
        } else {
            post.incrementKey("score")
            post.votes[currentUserId] = true
            post.saveInBackground()
            self.tableView.reloadData()
        }
    }
    
    @IBAction func downVotePressed(sender: AnyObject) {
        let tapPoint = sender.convertPoint(CGPointZero, toView: self.tableView)
        let tapIndex = self.tableView.indexPathForRowAtPoint(tapPoint)
        let post = objectAtIndexPath(tapIndex) as! MUNChatPost
        let currentUserId = PFUser.currentUser()!.objectId!
        
        //No votes pressed
        //Upvote already pressed
        //Downvote already pressed
        
        if let isUpVote = post.votes[currentUserId] {
            if isUpVote {
                post.incrementKey("score", byAmount: -2)
                post.votes[currentUserId] = false
                post.saveInBackground()
                self.tableView.reloadData()
            } else {
                post.incrementKey("score", byAmount: 1)
                post.votes.removeValueForKey(currentUserId)
                post.saveInBackground()
                self.tableView.reloadData()
            }
            
            
        } else {
            post.incrementKey("score", byAmount: -1)
            post.votes[currentUserId] = false
            post.saveInBackground()
            self.tableView.reloadData()
        }
    }
    
    @IBAction func flagPressed(sender: AnyObject) {
        performSegueWithIdentifier("MUNChatToFlagPost", sender: sender)
    }
    
    
    @IBAction func repliesPressed(sender: AnyObject) {
        performSegueWithIdentifier("MUNChatToPostReplies", sender: sender)
    }
    
    @IBAction func composePressed(sender: AnyObject) {
        print("COMPOSE POST PRESSED")
        performSegueWithIdentifier(self.composePostSegue, sender: nil)
    }
    

    
    
    

    // MARK: - Table view data source
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    } */

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
