//
//  DetailViewController.swift
//  chemCat
//
//  Created by lab on 3/31/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import UIKit

class addChemicalViewController: UIViewController {
    @IBAction func backBarButtonPress(sender: UIBarButtonItem) {
        performSegueWithIdentifier("backToChemicals", sender: self)
    }
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
        if valid == true {
            var ehs=true
            if chemEHSSegment.selectedSegmentIndex==1{
               ehs = false
            } else {
                ehs = true
            }
            let barCode = chemBarCodeField.text.toInt()!
            let name = chemNameField.text
            let stock = chemQuantityField.text.toInt()
            let exp = chemExpirationField.text.toInt()!
            let unit = chemUnitField.text
            
            let newChem = Chemical(barcode: barCode, name: name, stock: stock!, userNames: [], expDate: exp, units: unit, ehs: ehs)
            theInventoryModel.addChemical(newChem)
            /*let alertController = UIAlertController(title: name+" added.", message:
                "The chemical has been added. You will be taken back to to the list of chemicals now.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Thank you,", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            */
            performSegueWithIdentifier("backToChemicals", sender: self)
            
            
        }
        
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
        } else if(chemQuantityField.text.toInt() == nil){
            chemQuantityLabel.textColor = UIColor.redColor()
            valid = false
        } else if(chemQuantityField.text.toInt() < 0){
            chemQuantityLabel.textColor = UIColor.redColor()
            valid = false
        } else {
                chemQuantityLabel.textColor = UIColor.blackColor()
        }
        
        if (chemExpirationField.text==""){
            chemExpirationLabel.textColor = UIColor.redColor()
        } else if ((chemExpirationField.text.toInt()) == nil){
            valid = false
            chemExpirationLabel.textColor = UIColor.redColor()
        } else {
            chemExpirationLabel.textColor = UIColor.blackColor()
        }
    
        if (chemBarCodeField.text==""){
            valid = false
            chemBarCodeLabel.textColor = UIColor.redColor()
        } else if(chemBarCodeField.text.toInt() == nil){
            chemBarCodeLabel.textColor = UIColor.redColor()
            valid = false
        } else {
            chemBarCodeLabel.textColor = UIColor.blackColor()
            for i in 1...theInventoryModel.chemicalList.count{
                if theInventoryModel.chemicalList[i-1].barcode == (chemBarCodeField.text.toInt()!+10000000){
                    chemBarCodeLabel.textColor = UIColor.redColor()
                    valid = false
                    println("Barcode in System already. Enter another.")
                }
            }
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

