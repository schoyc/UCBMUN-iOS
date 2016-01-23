//
//  MUNChatPost.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 12/24/15.
//  Copyright © 2015 Steven Chen. All rights reserved.
//

import Foundation

class MUNChatPost: PFObject {
    
    @NSManaged var image: PFFile?
    @NSManaged var thumbnail: PFFile?
    @NSManaged var parentPostId: String?
    @NSManaged var text: String?
    @NSManaged var user: PFUser
    @NSManaged var username: String?
    @NSManaged var score: Int
    @NSManaged var flag: String?
    @NSManaged var votes: [String : Bool]
    @NSManaged var repliesCount: Int
    
    override class func query() -> PFQuery? {

        let query = PFQuery(className: MUNChatPost.parseClassName())
        
        query.includeKey("user")
        query.whereKey("parentPostId", equalTo: "")
        query.whereKey("flag", equalTo: "None")
        query.orderByDescending("createdAt")
        return query
    }
    
    init(parentPostId: String?, image: PFFile, user: PFUser, username: String?, text: String?, score: Int, flag: String?) {
        super.init()
        self.parentPostId = parentPostId
        self.image = image
        self.user = user
        self.username = username
        self.text = text
        self.score = score
        self.flag = flag
        //self.repliesCount = repliesCount
    }
    
    override init() {
          super.init()
    }
    
    class func queryPopularPosts() -> PFQuery? {
        let query = PFQuery(className: MUNChatPost.parseClassName())
        
        query.includeKey("user")
        query.whereKey("parentPostId", equalTo: "")
        query.whereKey("flag", equalTo: "None")
        query.orderByDescending("score")
        return query
    }
    
    class func queryReplies(parentPostId: String?) -> PFQuery? {
        print("Query Replies")

        let repliesQuery = PFQuery(className: MUNChatPost.parseClassName())
        
        
        repliesQuery.whereKey("parentPostId", equalTo: parentPostId!)
        print("RepliesQuery OK")
        
        let originalPostQuery = PFQuery(className: MUNChatPost.parseClassName())
        originalPostQuery.whereKey("objectId", equalTo: parentPostId!)
        
        let query = PFQuery.orQueryWithSubqueries([originalPostQuery, repliesQuery])
        query.whereKey("flag", equalTo: "None")
        query.orderByAscending("parentPostId")
        query.addDescendingOrder("score")
        return query
    }
    
    
}

extension MUNChatPost: PFSubclassing {
    // Table view delegate methods here
    //1
    class func parseClassName() -> String {
        return "MUNChatPost"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
}