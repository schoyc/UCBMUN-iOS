//
//  MerchOrder.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 1/30/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import Foundation

class MerchOrder : PFObject {
    var item: String?
    var recipient : String?
    var delivered : Bool?
    var quantity : Double?
    var comment : String?
    var cost : Double?
    
    init(item: String?, recipient: String?, delivered: Bool?, quantity: Double?, comment: String?, cost: Int?) {
        super.init()
        self.item = item
        self.recipient = recipient
        self.delivered = delivered
        self.quantity = quantity
        self.comment = comment
        self.cost = Double(cost!) * quantity!
    }
}
extension MerchOrder: PFSubclassing {
    // Table view delegate methods here
    //1
    class func parseClassName() -> String {
        return "MerchOrder"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
}