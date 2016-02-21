//
//  NewsPost.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 2/13/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import Foundation

class NewsPost: PFObject {
    
    @NSManaged var image: PFFile?
    @NSManaged var text: String?
    @NSManaged var headline: String?
    @NSManaged var priority: Int

    override class func query() -> PFQuery? {
        
        let query = PFQuery(className: NewsPost.parseClassName())
    
        query.orderByDescending("priority")
        query.addDescendingOrder("createdAt")
    
        return query
    }
    
    init(image: PFFile, headline: String?, text: String?, priority: Int) {
        super.init()
        self.image = image
        self.headline = headline
        self.text = text
        self.priority = priority
        //self.repliesCount = repliesCount
    }
    
    override init() {
        super.init()
    }
    
    
}

extension NewsPost: PFSubclassing {
    // Table view delegate methods here

    class func parseClassName() -> String {
        return "NewsPost"
    }
    

    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
}