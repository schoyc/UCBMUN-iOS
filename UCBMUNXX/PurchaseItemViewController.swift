//
//  PurchaseItemViewController.swift
//  UCBMUNXX
//
//  Created by Steven Chen on 1/30/16.
//  Copyright © 2016 Steven Chen. All rights reserved.
//

import UIKit

class PurchaseItemViewController: UIViewController, UITextViewDelegate {
    
    private var product : MerchProduct?
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var quantityStepper: UIStepper!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var purchaseRecipient: UITextField!
    
    @IBOutlet weak var purchaseComment: UITextView!
    
    
    
    required init?(coder aDecoder: NSCoder) {
        print("Replies Table View rendering")
        super.init(coder: aDecoder)
        self.product = nil
    }
    
    deinit {
        print("deinit RepliesTableViewController")
    }
    
    func setProduct(product: MerchProduct?) {
        self.product = product!
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        quantityStepper.wraps = true
        quantityStepper.maximumValue = 10
        
        productName.text = product?.name!
        productImage.image = UIImage(named: (product?.image!)!)
        
        productPrice.text = "$\(String(product!.price!)).00"
        
        purchaseComment.text = "Write your candygram message or any comments (e.g. shirt size) here."
        purchaseComment.textColor = UIColor.lightGrayColor()
        purchaseComment.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stripeClicked(sender: AnyObject) {
        performSegueWithIdentifier("toStripe", sender: nil)
    }
    
    @IBAction func stepperValueChanged(sender: UIStepper) {
        quantityLabel.text = (Int) (sender.value).description
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.textColor == UIColor.lightGrayColor() {
            textView.text = nil
            textView.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write your candygram message or any comments (e.g. shirt size) here."
            textView.textColor = UIColor.lightGrayColor()
        }
    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let order = MerchOrder(item: product!.name!, recipient: purchaseRecipient.text!, delivered: false, quantity: quantityStepper.value, comment: purchaseComment.text!, cost: product!.price)
        let paymentVC = segue.destinationViewController as! PaymentViewController
        paymentVC.order = order
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    
    
    

}
