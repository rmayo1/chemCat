//
//  addEquipmentViewController.swift
//  chemCat
//
//  Created by Rawaid Akhtar on 4/30/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import UIKit

class addEquipmentViewController: UIViewController {
    
    @IBAction func equipBreakableSegmentToggle(sender: AnyObject) {
        if sender.selectedSegmentIndex == 0{
            var breakable = true
        } else{
            var breakable = false
        }
    }
    @IBOutlet weak var equipBarcodeLabel: UILabel!
    @IBOutlet weak var equipBreakableLabel: UILabel!
    @IBOutlet weak var equipConditionLabel: UILabel!
    @IBOutlet weak var equipStockLabel: UILabel!
    @IBOutlet weak var equipNameLabel: UILabel!
    @IBOutlet weak var equipBarcodeField: UITextField!
    @IBOutlet weak var equipBreakableSegment: UISegmentedControl!
    @IBOutlet weak var equipConditionField: UITextField!
    @IBOutlet weak var equipNameField: UITextField!
    @IBOutlet weak var equipStockField: UITextField!
    @IBAction func addEquipmentOnClick(sender: AnyObject) {
        var valid = checkInfo()
        if valid == true {
            var breakable = true
            if equipBreakableSegment.selectedSegmentIndex == 1{
                breakable = false
            } else{
                breakable = true
            }
            let barcode = equipBarcodeField.text.toInt()!
            let name = equipNameField.text
            let stock = equipStockField.text.toInt()
            let condition = equipConditionField.text
            
            
            let newEquipment = Equipment(barcode:barcode, name:name, stock: stock!, userNames: [], condition:condition,  breakable:breakable)
            theInventoryModel.addEquipment(newEquipment)
            /*let alertController = UIAlertController(title: name+" added.", message:
            "The chemical has been added. You will be taken back to to the list of chemicals now.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Thank you,", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            */
            performSegueWithIdentifier("backToEquipment", sender: self)
            
            
        }
        
    }
    
    func checkInfo()->Bool{
        var valid = true
        if (equipNameField.text==""){
            valid = false
            equipNameLabel.textColor = UIColor.redColor()
        } else {
            equipNameLabel.textColor = UIColor.blackColor()
        }
        if (equipStockField.text==""){
            valid = false
            equipStockLabel.textColor = UIColor.redColor()
        } else {
            equipStockLabel.textColor = UIColor.blackColor()
        }
        
        if (equipConditionField.text==""){
            valid = false
            equipConditionLabel.textColor = UIColor.redColor()
        } else {
            equipConditionLabel.textColor = UIColor.blackColor()
        }
        
        
        if (equipBarcodeField.text==""){
            valid = false
            equipBarcodeLabel.textColor = UIColor.redColor()
        } else if(equipBarcodeField.text.toInt() == nil){
            equipBarcodeLabel.textColor = UIColor.redColor()
            valid = false
        } else {
            equipBarcodeLabel.textColor = UIColor.blackColor()
            for i in 1...theInventoryModel.equipmentList.count{
                if theInventoryModel.equipmentList[i-1].barcode == (equipBarcodeField.text.toInt()!+10000000){
                    equipBarcodeLabel.textColor = UIColor.redColor()
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
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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