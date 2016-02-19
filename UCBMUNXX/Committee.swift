//
//  Committee.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 2/4/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import Foundation

class Committee {
    var name : String?
    var subtitle : String?
    var image : String?
    var room : String?
    
    init(name: String?, subtitle: String?, image: String?, room: String?) {
        self.name = name
        self.subtitle = subtitle
        self.image = image
        self.room = room
    }
}