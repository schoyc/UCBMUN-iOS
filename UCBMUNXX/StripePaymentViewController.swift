//
//  StripePaymentViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 2/17/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import UIKit
import Stripe

class StripePaymentViewController: PaymentViewController, STPPaymentCardTextFieldDelegate {
    let paymentTextField = STPPaymentCardTextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentTextField.frame = CGRectMake(15, 15, CGRectGetWidth(self.view.frame) - 30, 44)
        paymentTextField.delegate = self
        view.addSubview(paymentTextField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitPayment(sender: AnyObject) {
        let card = paymentTextField.cardParams
        STPAPIClient.sharedClient().createTokenWithCard(card) { (token, error) -> Void in
            if let error = error  {
                self.handleStripeError(error)
            }
            else if let token = token {
                let stripeAmount = Double(self.order!.cost!) / 0.971 + 0.3
                self.createBackendChargeWithToken(token, amount: stripeAmount) { status in
                    
                }
            }
            
        }
    }
    
    func handleStripeError(error: NSError) {
        let alertView = UIAlertController(title: "Something went wrong. Please try submitting payment again.", message: error.localizedDescription, preferredStyle: .Alert)
        
        alertView.addAction(UIAlertAction(title: "Close", style: .Default, handler: nil))
        presentViewController(alertView, animated: true, completion: nil)
        
    }
    
    func showPaymentSuccess() {
        let alertView = UIAlertController(title: "Payment Successful!", message: "Go to the Office of Delegate Services to pick up your order.", preferredStyle: .Alert)
        
        alertView.addAction(UIAlertAction(title: "Close", style: .Default, handler: {(alert: UIAlertAction!) in self.returnToStore()}))
        presentViewController(alertView, animated: true, completion: nil)
        
    }
    
    func returnToStore() {
        performSegueWithIdentifier("fromStripeToStore", sender: nil)
    }
    
    func createBackendChargeWithToken(token: STPToken, amount: Double, completion: PKPaymentAuthorizationStatus -> ()) {
        let url = NSURL(string: "https://example.com/token")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        let currentUser = PFUser.currentUser()?.email
        let bodyData = "stripeToken=(token.tokenId)&amount=(amount)&email=(currentUser)"
        request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding)
        let configuration = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if error != nil {
                self.handleStripeError(error!)
            }
            else {
                let order = self.order as MerchOrder!
                order!.saveInBackground()
                self.showPaymentSuccess()
            }
        }
        task.resume()
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
