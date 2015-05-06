//
//  DetailViewController.swift
//  chemCat
//
//  Created by lab on 3/31/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import UIKit
/* class: addChemicalViewController
* Parameters: n/a
* Output: n/a
* Last Modified: 5/6/15
* Author: Rob
* Purpose: maintains and holds code for adding chemicals page
*/
class addChemicalViewController: UIViewController {
    /* func: backBarButtonPress
    * Parameters: Sender, on button click
    * Output: n/a
    * Last Modified: 5/6/15
    * Author: Rob
    * Purpose: segues back to chemical page on press
    */
    @IBAction func backBarButtonPress(sender: UIBarButtonItem) {
        performSegueWithIdentifier("backToChemicals", sender: self)
    }
    // initialises labels, fields and items on view controller
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
    
    /* func: EHSSegmentToggle
    * Parameters: sender, on switch
    * Output: n/a
    * Last Modified: 5/6/15
    * Author: Rob
    * Purpose: changes ehs boolean depending on what toggled value is
    */
    @IBAction func EHSSegmentToggle(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex==0{
            var ehs = true
        } else {
            var ehs = false
        }
    }
    /* func: addChemicalOnClick
    * Parameters: sender, on click
    * Output: n/a
    * Last Modified: 5/6/15
    * Author: Rob
    * Purpose: adds the chemical to the sharedInventoryModel's chemical list.
    */
    @IBAction func addChemicalOnClick(sender: AnyObject) {
        // checks validity of view controller's fields
        var valid = checkInfo()
        // if info is valid, compiles info into chemical class and adds to shared singleton chemical list. Returns to previous page
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
    /* func: CheckInfo
    * Parameters: N/A
    * Output: boolean
    * Last Modified: 5/6/15
    * Author: Rob
    * Purpose: checks if all info in fields are valid, returns true if so
    */
    func checkInfo()->Bool{
        // initializes validity boolean as true
        var valid = true
        // sets bool as false if fields are empty...
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
        // sets bool as false if quantity isn't a number/isn't above 0
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
        // sets bool to false if year isnt an integer
        if (chemExpirationField.text==""){
            chemExpirationLabel.textColor = UIColor.redColor()
        } else if ((chemExpirationField.text.toInt()) == nil){
            valid = false
            chemExpirationLabel.textColor = UIColor.redColor()
        } else {
            chemExpirationLabel.textColor = UIColor.blackColor()
        }
        //sets to false is four digit code isn't an int, or already added
    
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
    //initializes sharedInventory model for viewController
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

