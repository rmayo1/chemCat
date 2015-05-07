//
//  DetailViewController.swift
//  chemCat
//
//  Created by lab on 3/31/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import UIKit

class detailEquipmentController: UIViewController {
    
    var theInventoryModel: sharedInventoryModel = sharedInventoryModel.theSharedInventoryModel
    let simpleTableIdentifier = "SimpleTableIdentifier"
    var displayList = []
    
    @IBAction func backButtonUIAction(sender: UIBarButtonItem) {
        performSegueWithIdentifier("backToMain", sender: sender)
    }
    

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        theInventoryModel.getCurrentEquipment(String((displayList[indexPath.row] as Equipment).name))
        performSegueWithIdentifier("ItemDetail", sender: self)
    }
    
    override func viewDidLoad() {
        
        //test code
        if (theInventoryModel.mode == "Equipment"){
            displayList = theInventoryModel.equipmentList
        }
        if (theInventoryModel.mode == "Chemicals"){
            displayList = theInventoryModel.chemicalList
        }
        println(theInventoryModel.mode)
        println(displayList.count)
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayList.count
    }
    
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as? UITableViewCell
        if (cell == nil){
            cell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:simpleTableIdentifier)
            cell!.textLabel?.text = "things"
        }
        cell?.textLabel?.text = String((displayList[indexPath.row] as Equipment).name)
        cell?.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        
        return cell!
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

