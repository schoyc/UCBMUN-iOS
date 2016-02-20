//
//  ProgramEvent.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 2/20/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import Foundation

class ProgramEvent {
    var name : String?
    var description : String?
    var time : String?
    var location : String?
    
    init(name: String?, description: String?, time: String?, location: String?) {
        self.name = name
        self.description = description
        self.time = time
        self.location = location
    }
}