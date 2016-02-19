//
//  ScheduleTableViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 1/28/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import UIKit

let cellID = "scheduleCell"
class ScheduleTableViewController: ExpandableTableViewController {
    var selectedIndexPath : NSIndexPath?

    override func loadData() {
        groupArray = ["Thursday","Friday", "Saturday", "Sunday"]
        boolArray = [Bool](count: groupArray.count, repeatedValue: false)
        
        let thursday = [
            ScheduleItem(name: "Registration", time: "3:30pm - 6:15pm"),
            ScheduleItem(name: "Model UN 101", time: "4:30pm - 6:00pm"),
            ScheduleItem(name: "Opening Ceremony", time: "6:30pm - 7:30pm"),
            ScheduleItem(name: "Committee Session I", time: "7:45pm - 9:45pm"),
            ScheduleItem(name: "Head Delegate Feedback", time: "10:00pm - 10:30pm"),
            ScheduleItem(name: "Bear Crawl", time: "10:45pm - onwards"),
        ]
        
        let friday = [
            ScheduleItem(name: "San Francisco Tours", time:  "8:30am - 12:00pm"),
            ScheduleItem(name: "Committee Session II", time:  "1:00pm - 5:00pm"),
            ScheduleItem(name: "Advisor Feedback Forum", time:  "3:00pm - 3:30pm"),
            ScheduleItem(name: "Dinner", time:  "5:00pm - 6:30pm"),
            ScheduleItem(name: "Committee Session III", time:  "6:30pm - 9:30pm"),
            ScheduleItem(name: "Head Delegate Feedback", time:  "9:45pm - 10:15pm"),
            ScheduleItem(name: "Jazz Night", time:  "10:30pm - 1:00am"),
    
        ]
    
        let saturday = [
            ScheduleItem(name: "Committee Session IV", time:  "10:00am - 1:00pm"),
            ScheduleItem(name: "Advisor Feedback Forum", time:  "11:30am - 12:00pm"),
            ScheduleItem(name: "Head Delegate Feedback", time:  "1:15pm - 1:45pm"),
            ScheduleItem(name: "Lunch", time:  "1:00pm - 3:00pm"),
            ScheduleItem(name: "Committee Session V", time:  "3:00pm - 7:00pm"),
            ScheduleItem(name: "Delegate Soiree", time:  "10:00pm - 2:00am"),
        ]
        
        let sunday = [ScheduleItem(name: "Closing Ceremony", time:  "10:00am - 12:00pm")]
        
        dataDic["Thursday"] = thursday
        dataDic["Friday"] = friday
        dataDic["Saturday"] = saturday
        dataDic["Sunday"] = sunday
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("scheduleCell", forIndexPath: indexPath) as! ScheduleTableViewCell
        
        let boolForSec = boolArray[indexPath.section] as Bool
        if (boolForSec) {
            var arr : [AnyObject] = dataDic[groupArray[indexPath.section]]!
            let item = arr[indexPath.row] as! ScheduleItem
            cell.itemName?.text = item.name!
            cell.itemTime?.text = item.time!
        }else {
            
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
        //headerView.backgroundColor = UIColor.blueColor()
        headerView.tag = section
        
        let headerString = UILabel(frame: CGRect(x: 10, y: 10, width: tableView.frame.size.width-10, height: 30)) as UILabel
        headerString.text = groupArray[section] as String
        headerView .addSubview(headerString)
        
        let headerTapped = UITapGestureRecognizer (target: self, action:"sectionHeaderTapped:")
        headerView .addGestureRecognizer(headerTapped)
        
        return headerView
    }

}
