//
//  ProgrammingViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 2/20/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import UIKit

class ProgrammingViewController: ExpandableTableViewController {

    var selectedIndexPath : NSIndexPath?
    
    override func loadData() {
        groupArray = ["Thursday - Bear Crawl & Hookah Night", "Friday - Jazz Night", "Saturday - Delegate Soiree"]
        boolArray = [Bool](count: groupArray.count, repeatedValue: false)
        
        let thursday = [
            ProgramEvent(name: "Bear Crawl", description: "We invite delegates who are 21+ to join us for a neighborhood bar crawl on Thursday night led by UCBMUN staff members. Come experience one of San Francisco’s most historic neighborhoods - one of the bars on our bar crawl was a favorite of the Beat Generation. Each bar has a different theme and all are in close proximity to the hotel.", time: "11:00pm - 1:00am", location: "Meet at Hilton Lobby."),
            ProgramEvent(name: "Hookah Night", description: "Join members of the UCBMUN staff as they travel to one of San Francisco’s premier Hookah Bars. We will have a night of tea, finger food, and hookah while experiencing a taste of San Francisco’s nightlife. You must be 18 to attend this event.", time: "11:00pm - 1:00am", location: "Meet at Hilton Lobby.")
            
        ]
        
        let friday = [
            ProgramEvent(name: "Jazz Night", description: "On Friday night, UCBMUN will host a jazz soiree in the Grand Ballroom of the Hilton, complete with a live jazz quartet and a photo booth. Dress to impress and come boogie with us! A bar will be available for those delegates over 21 who wish to drink.", time: "10:00pm - 1:00am", location: "Grand Ballroom, 3rd Floor")
            
        ]
        
        let saturday = [
            ProgramEvent(name:"Delegate Soiree", description: "UCBMUN’s greatly anticipated annual Soiree will take place on Saturday night, when the Horizon Ultra Lounge becomes hotter than the Delegate’s Lounge at the UN. Come celebrate a fantastic conference and dance the night away with new and old friends, allies, and adversaries.", time: "10:00pm - 2:00am", location: "498 Broadway Street, San Francisco, CA 94133")
        ]
        
        dataDic["Thursday - Bear Crawl & Hookah Night"] = thursday
        dataDic["Friday - Jazz Night"] = friday
        dataDic["Saturday - Delegate Soiree"] = saturday
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("programCell", forIndexPath: indexPath) as! ProgramEventCell
        
        let boolForSec = boolArray[indexPath.section] as Bool
        if (boolForSec) {
            var arr : [AnyObject] = dataDic[groupArray[indexPath.section]]!
            let item = arr[indexPath.row] as! ProgramEvent
            cell.eventTitle?.text = item.name!
            cell.eventDescription?.text = item.description!
            cell.eventTime?.text = item.time!
            cell.eventLocation?.text = item.location!
        }else {
            
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
        headerView.backgroundColor = UIColor(red: 0.588, green:0.757, blue:0.839, alpha:1)
        headerView.tag = section
        
        let headerString = UILabel(frame: CGRect(x: 10, y: 10, width: tableView.frame.size.width-10, height: 30)) as UILabel
        headerString.text = groupArray[section] as String
        headerString.font = UIFont(name:"HelveticaNeue-Medium", size: 16.0)
        headerView .addSubview(headerString)
        
        let headerTapped = UITapGestureRecognizer (target: self, action:"sectionHeaderTapped:")
        headerView .addGestureRecognizer(headerTapped)
        
        return headerView
    }


}
