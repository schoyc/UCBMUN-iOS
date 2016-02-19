//
//  MerchProduct.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 1/30/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import Foundation

class MerchProduct {
    var name : String?
    var price : Int?
    var description : String?
    var image: String?

    init(name: String?, price: Int?, description: String?, image: String?) {
        self.name = name
        self.price = price
        self.description = description
        self.image = image
    }
}