//
//  itemDetailView.swift
//  chemCat
//
//  Created by lab on 5/6/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import UIKit

class itemDetailView: UIViewController {
    
    var theInventoryModel: sharedInventoryModel = sharedInventoryModel.theSharedInventoryModel
    
    @IBOutlet weak var thingName: UILabel!
    /*func checkOut
    *Author: Josh
    *Last Modified: 5/6/15
    *Purpose: beta test version of check out feature. Deletes item from inventory
    */
    @IBAction func checkOut(sender: UIButton) {
        if(theInventoryModel.mode == "Chemicals"){
            theInventoryModel.checkOutChem(theInventoryModel.currChemical)
        }else{
            theInventoryModel.checkOutEq(theInventoryModel.currEquipment)
        }
    }
    /*func checkOut
    *Author: Josh
    *Last Modified: 5/6/15
    *Purpose: beta test version of check in feature. Does nothing yet. Calls the checkIn() method in thesharedInventoryModel
    */
    @IBAction func checkIn(sender: UIButton) {
        if(theInventoryModel.mode == "Chemicals"){
            theInventoryModel.checkInChem(theInventoryModel.currChemical)
        }else{
            theInventoryModel.checkInEq(theInventoryModel.currEquipment)
        }
    }
    /*func backButtonUIAction
    Parameters: N/A
    * Output: N/A
    * Last Modified: 5/6/15
    *Author: Josh
    *Purpose: segue back to inventory
    */
    @IBAction func backButtonUIAction(sender: UIBarButtonItem) {
        performSegueWithIdentifier("backtoinventory", sender: sender)
    }
    
    /*func viewDidLoad
    Parameters:N/A
    *Output: N/A
    *Last Modified: 5/6/15
    *Author: Josh
    *Purpose: get the right inventory element for the current view to work with. Also changes UIlabel accordingly
    */
    override func viewDidLoad() {
        if(theInventoryModel.mode == "Chemicals"){
            print(theInventoryModel.currChemical.name)
            thingName.text = theInventoryModel.currChemical.name
        }else{
            print(theInventoryModel.currEquipment.name)
            thingName.text = theInventoryModel.currEquipment.name
        super.viewDidLoad()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}