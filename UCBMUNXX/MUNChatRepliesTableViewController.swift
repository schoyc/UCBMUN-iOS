//
//  MUNChatRepliesTableViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 12/29/15.
//  Copyright © 2015 Steven Chen. All rights reserved.
//

import UIKit

class MUNChatRepliesTableViewController: MUNChatTableViewController {
    
    private var parentPostId: String?
    
    required init?(coder aDecoder: NSCoder) {
        print("Replies Table View rendering")
        super.init(coder: aDecoder)
        
    }
    
    deinit {
        print("deinit RepliesTableViewController")
    }
    
    func setParentPost(id: String?) {
        self.parentPostId = id!
    }
    
    override func queryForTable() -> PFQuery {
        let query = MUNChatPost.queryReplies(self.parentPostId)
        return query!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
            case "RepliesToComposePost":
                let composePostVC = segue.destinationViewController as! ComposePostViewController
                composePostVC.setPostToReply(self.parentPostId!)
            
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
    
    @IBAction func replyPressed(sender: AnyObject) {
        performSegueWithIdentifier("RepliesToComposePost", sender: sender)
    }
    
    @IBAction func backToMUNChatPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func flagClicked(sender: AnyObject) {
        performSegueWithIdentifier("MUNChatToFlagPost", sender: nil)
    }
    


    

   
}
