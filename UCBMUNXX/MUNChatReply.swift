//
//  MUNChatReply.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 12/28/15.
//  Copyright © 2015 Steven Chen. All rights reserved.
//

import Foundation

class MUNChatReply: PFObject {
    
    @NSManaged var image: PFFile?
    @NSManaged var text: String?
    @NSManaged var user: PFUser
    @NSManaged var score: Int
    @NSManaged var parentPostId: String?
    @NSManaged var flag: String?
    @NSManaged var votes: [String : Bool]
    
    override class func query() -> PFQuery? {
        
        let query = PFQuery(className: MUNChatReply.parseClassName())
        
        query.orderByDescending("createdAt")
        return query
    }
    
    init(image: PFFile, user: PFUser, text: String?, score: Int, flag: String?, parentPostId: String?) {
        super.init()
        self.image = image
        self.user = user
        self.text = text
        self.score = score
        self.flag = flag
        self.parentPostId = parentPostId
    }
    
    override init() {
        super.init()
    }
    
    class func queryPopularPosts() -> PFQuery? {
        let query = PFQuery(className: MUNChatPost.parseClassName())
        
        query.includeKey("user")
        query.orderByDescending("score")
        return query
    }
    
}

extension MUNChatReply: PFSubclassing {
    // Table view delegate methods here
    //1
    class func parseClassName() -> String {
        return "MUNChatReply"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
}