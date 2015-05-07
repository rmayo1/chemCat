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
    *Purpose: get the right inventory element for the current view to work with
    */
    override func viewDidLoad() {
        if(theInventoryModel.mode == "Chemicals"){
            print(theInventoryModel.currChemical.name)
        }else{
            print(theInventoryModel.currEquipment.name)
        super.viewDidLoad()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}