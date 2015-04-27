//
//  DetailViewController.swift
//  chemCat
//
//  Created by lab on 3/31/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import UIKit

class addChemicalViewController: UIViewController {
    @IBOutlet weak var chemNameField: UITextField!
    @IBOutlet weak var chemNameLabel: UILabel!
    @IBOutlet weak var chemUnitField: UITextField!
    @IBOutlet weak var chemUnitLabel: UILabel!
    
    @IBOutlet weak var chemQuantityField: UITextField!
    @IBOutlet weak var chemQuantityLabel: UILabel!
    
    @IBOutlet weak var chemEHSSegment: UISegmentedControl!
    @IBOutlet weak var chemEHSLabel: UILabel!
    
    @IBOutlet weak var chemExpirationField: UITextField!
    @IBOutlet weak var chemExpirationLabel: UILabel!
    
    @IBOutlet weak var chemBarCodeField: UITextField!
    @IBOutlet weak var chemBarCodeLabel: UILabel!
    
    @IBAction func EHSSegmentToggle(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex==0{
            var ehs = true
        } else {
            var ehs = false
        }
    }
    @IBAction func addChemicalOnClick(sender: AnyObject) {
        var valid = checkInfo()
    }
    
    func checkInfo()->Bool{
        var valid = true
        if (chemNameField.text==""){
            valid = false
            chemNameLabel.textColor = UIColor.redColor()
        } else {
            chemNameLabel.textColor = UIColor.blackColor()
        }
        if (chemUnitField.text==""){
            valid = false
            chemUnitLabel.textColor = UIColor.redColor()
        } else {
            chemUnitLabel.textColor = UIColor.blackColor()
        }
        if (chemQuantityField.text==""){
            valid = false
            chemQuantityLabel.textColor = UIColor.redColor()
        } else {
            var quant = chemQuantityField.text.toInt()
            if (quant<0){
                chemQuantityLabel.textColor = UIColor.redColor()
            } else {
                chemQuantityLabel.textColor = UIColor.blackColor()
            }
        }
        if (ehs==true || ehs==false){
            chemEHSLabel.textColor = UIColor.redColor()
        } else {
            chemEHSLabel.textColor = UIColor.blackColor()
        }
        
        return valid
    }
    var theInventoryModel: sharedInventoryModel = sharedInventoryModel.theSharedInventoryModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

