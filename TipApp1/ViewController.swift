//
//  ViewController.swift
//  TipApp1
//
//  Created by David King on 12/27/17.
//  Copyright © 2017 David King. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipamt: UILabel!

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var percentage: UISegmentedControl!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // like an actionlistener
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    
    
    @IBAction func billchange(_ sender: AnyObject) {
    
        var segment = 0
    // makes sure its not nil, makes code complicated should use ?? next
    //time
        if (percentage != nil)
        {
            segment = percentage.selectedSegmentIndex
            //percent selected
           var percent = percentage.titleForSegment(at: segment)!
            //removing the % sign
            percent = percent.replacingOccurrences(of: "%", with: "")
            
            //move decimal of percentage and make integer
            let per: Double = Double(percent)!/100
     
  
                let bills =  billField!
                
                if (bills.text == ".")
                {
                    bills.text = "0."
                }
            
                if (bills.text == "")
            
                {
                    total.text = "$0.00"
                    
                    //total tip
                    tipamt.text = "$0.00"
                }
             
                if let billamount =  Double(bills.text!){
                  
                    // tip total
                    let Per_tip:Double = billamount * per
                    
                    //total bilgratuity
                    let totalbill:Double = billamount + Per_tip
                    
                     total.text = "$\(totalbill)"
                    
                    //total tip
                    tipamt.text = "$\(String(Per_tip))"
                    
                    if (billamount == 0)
                    {
                        print("dam")
                        total.text = "$0.00"
                        
                        //total tip
                        tipamt.text = "$0.00"
                    }
                    
                }
                else if (bills.text != "")
                {
                    tipamt.text = "invalid Bill amount"
                    total.text = "invalid Bill amount"
                    
                }

        }
        
}

    
    
  
    
    @IBAction func perchanged(_ sender: AnyObject) {
        
       
        if (percentage != nil)
        {
            
            var segment = percentage.selectedSegmentIndex
            var percent = percentage.titleForSegment(at: segment)!
            
            //removing the % sign
            percent = percent.replacingOccurrences(of: "%", with: "")
            
            //move decimal of percentage and make integer
            let per: Double = Double(percent)!/100
            
            if (billField != nil)
                
            {
                //doesnt run if = to nil
                if let billamount = Double(billField.text!){
                
                // tip total
                let Per_tip:Double = billamount * per
                
                //total bilgratuity
                let totalbill:Double = billamount + Per_tip
                
                total.text = "$\(totalbill)"
                
                //total tip
                tipamt.text = "$\(String(Per_tip))"
                
            }
            
            }
            
        }
    }
    
    
    }
    
    
    

