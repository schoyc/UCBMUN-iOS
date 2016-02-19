//
//  ScheduleTableViewCell.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 1/28/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import UIKit

class ScheduleTableViewCell : UITableViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemTime: UILabel!

//    class var expandedHeight: CGFloat {get {return 200} }
//    class var defaultHeight: CGFloat {get {return 45 } }
    
//    func checkHeight() {
//        daySchedule.hidden = (frame.size.height < ScheduleTableViewCell.expandedHeight)
//    }
//    
//    func watchFrameChanges() {
//        addObserver(self, forKeyPath: "frame", options: .New, context: nil)
//    }
//    
//    func ignoreFrameChanges() {
//        removeObserver(self, forKeyPath: "frame")
//    }
//    
//    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
//        if keyPath == "frame" {
//            checkHeight()
//        }
//    }
    
}
