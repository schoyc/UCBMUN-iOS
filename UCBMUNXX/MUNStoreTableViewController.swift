//
//  MUNStoreTableViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 1/30/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import UIKit

class MUNStoreTableViewController: UITableViewController {
    
    let products = [MerchProduct(name: "UCBMUN XX T-Shirt", price: 15, description: "Remember your time at UCBMUN XX with a limited edition shirt commemorating our 20th conference!", image: "wsf.png"), MerchProduct(name: "UCBMUN XX T-Shirt", price: 15, description: "Remember your time at UCBMUN XX with a limited edition shirt commemorating our 20th conference!", image: "wsf.png"),
        MerchProduct(name: "UCBMUN XX Beer Mugs", price: 15, description: "Drink to substantive debate and joyous cameraderie with the first ever UCBMUN beer mug!", image: "wsf.png"),
        MerchProduct(name: "UCBMUN XX Shot Glasses", price: 15, description: "Drink to substantive debate and joyous cameraderie with the first ever UCBMUN beer mug!", image: "wsf.png"),
        MerchProduct(name: "Candy Grams", price: 3, description: "Send something sweet to that good looking delegate from New Zealand or you partner in crime in the Rolex XII.", image: "wsf.png"),
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadProducts() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("toPurchaseItem", sender: tableView)
    }
    
    @IBAction func purchaseItem(sender: AnyObject) {
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("merchCell", forIndexPath: indexPath) as! MUNStoreTableViewCell
        let product = self.products[indexPath.row]
        
        cell.itemName.text = product.name
        cell.itemDescription.text = product.description
        cell.itemPrice.text = "$\(String(product.price!)).00"
        cell.itemPicture.image = UIImage(named: product.image!)
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
        case "toPurchaseItem":
            let sender = sender as! UITableView
            let indexPath = sender.indexPathForSelectedRow!
            let product = self.products[indexPath.row]
            
            let purchaseItemVC = segue.destinationViewController as! PurchaseItemViewController
            purchaseItemVC.setProduct(product)
            
        default:
            print("No segue prep")
        }
        
        
    }
    
    

}
