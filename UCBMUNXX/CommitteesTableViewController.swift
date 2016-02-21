//
//  CommitteesTableViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 2/4/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import UIKit

class CommitteesTableViewController: ExpandableTableViewController {

    var selectedIndexPath : NSIndexPath?
    
    override func loadData() {
        groupArray = ["Specialized Bodies","Crisis Committees", "Joint Crisis Committees"]
        boolArray = [Bool](count: groupArray.count, repeatedValue: false)
        
        let sbs = [
            Committee(name: "World Social Forum:", subtitle :  "Another World is Possible!", image:"wsf.png", room: "Pine"),
            Committee(name: "NFL Owners' Meeting:", subtitle :  "2016", image:"nfl.png", room: "Columbus 3"),
            Committee(name: "Legal Committee:", subtitle :  "European Court of Human Rights", image:"legal.png", room: "Columbus 2"),
            Committee(name: "DISEC:", subtitle :  "Disarmament and International Security", image:"disec.png", room: "Columbus 1"),
            Committee(name: "General Assembly:", subtitle :  "The Special Political and Decolonization Committee", image:"specpol.png", room: "Grand Ballroom")
        ]
        
        let crises = [
            Committee(name: "The Ad Hoc Committee", subtitle: "of the Secretary-General", image:"adhoc.png", room: "Pyramid"),
            Committee(name: "A Clash of Three Kingdoms:", subtitle :  "The Battle at the Red Cliff", image:"redcliff.png", room: "Valencia"),
            Committee(name: "Obama Unleashed or Rejected:", subtitle :  "The Cabinet of the Presidency of the United States", image:"obama.png", room: "Embarcadero"),
            Committee(name: "Conquering the Web:", subtitle :  "Industry, Government, and the Dark Net", image:"darkweb.png", room: "Davis"),
            Committee(name: "Rome's Forgotten Colony:", subtitle :  "Pontius Pilate and the Divisions of Judea", image:"pilate.png", room: "The Cloud"),
            Committee(name: "Colombia:", subtitle :  "Peace Accords with FARC", image:"colombia.png", room: "Sansome"),
            Committee(name: "The Rolex 12:", subtitle :  "Marcos' Phillipines under Martial Law", image:"marcos.png", room: "Front"),
            Committee(name: "UN Security Council:", subtitle :  "Indian and Pakistan in 1947", image:"unsc.png", room: "Washington"),
            Committee(name: "Cabinet of the Iron Lady:", subtitle :  "There is no alternative.", image:"thatcher.png", room: "Grant"),
            
        ]
        
        let jcc = [
            Committee(name: "The Government of Rhodesia", subtitle: "", image:"rhodesia.png", room: "Mason 1"),
            Committee(name: "Zimbabwe African National Union:", subtitle :  "(ZANU)", image:"zanu.png", room: "Mason 2"),
            Committee(name: "Zimbabwe African People's Union:", subtitle :  "(ZAPU)", image:"zapu.png", room: "Montgomery")
            
        ]
        
        dataDic["Specialized Bodies"] = sbs
        dataDic["Crisis Committees"] = crises
        dataDic["Joint Crisis Committees"] = jcc
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("committeesCell", forIndexPath: indexPath) as! CommitteesTableViewCell
        
        let boolForSec = boolArray[indexPath.section] as Bool
        if (boolForSec) {
            var arr : [AnyObject] = dataDic[groupArray[indexPath.section]]!
            let item = arr[indexPath.row] as! Committee
            cell.committeeName?.text = item.name!
            cell.committeeSubtitle?.text = item.subtitle!
            cell.committeeRoom?.text = item.room!
            cell.committeeImage?.image = UIImage(named: item.image!)
            
        }else {
            
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
        //headerView.backgroundColor = UIColor.blueColor()
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
