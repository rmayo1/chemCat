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
    
    @IBOutlet weak var prevUIBarButton: UIBarButtonItem!
    @IBAction func prevUIBarButtonPress(sender: UIBarButtonItem) {
        
        performSegueWithIdentifier("backToCategories", sender: sender)
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
    
    override func viewDidLoad() {
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
        //        let image = UIImage(named: "star")
        //        cell!.imageView?.image = image
        //        let highlightedImage = UIImage(named: "star")
        //        cell!.imageView?.image = highlightedImage
        
        //cell?.textLabel?.text = string(displayList[indexPath.row])
        cell?.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        
        return cell!
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

