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
    
    
    
    
    @IBAction func backButtonUIAction(sender: UIBarButtonItem) {
        performSegueWithIdentifier("backtoinventory", sender: sender)
    }
    override func viewDidLoad() {
        if(theInventoryModel.mode == "Chemical"){
            print(theInventoryModel.currChemical.name)
        }
        else{
            print(theInventoryModel.currEquipment.name)
        }
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}