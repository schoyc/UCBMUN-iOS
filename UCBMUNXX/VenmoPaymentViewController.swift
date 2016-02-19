//
//  VenmoPaymentViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 2/17/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import UIKit

class VenmoPaymentViewController: PaymentViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func placeOrder(sender: AnyObject) {
        let venmoOrder = self.order!
        venmoOrder.saveInBackgroundWithBlock({succeeded, error in
            if succeeded {
                self.showPaymentSuccess()
            } else {
                
            }
        
        })
    }
    
    func showPaymentSuccess() {
        let alertView = UIAlertController(title: "Order Sent", message: "Go to the Office of Delegate Services to pick up your order.", preferredStyle: .Alert)
        
        alertView.addAction(UIAlertAction(title: "Close", style: .Default, handler: {(alert: UIAlertAction!) in self.returnToStore()}))
        presentViewController(alertView, animated: true, completion: nil)
        
    }
    
    
    func returnToStore() {
        performSegueWithIdentifier("fromVenmoToStore", sender: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
