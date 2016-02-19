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
    var cost : Int?
    
    init(item: String?, recipient: String?, delivered: Bool?, quantity: Double?, comment: String?, cost: Int?) {
        super.init()
        self.item = item
        self.recipient = recipient
        self.delivered = delivered
        self.quantity = quantity
        self.comment = comment
        self.cost = cost
    }
}