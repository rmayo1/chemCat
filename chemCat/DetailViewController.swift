//
//  DetailViewController.swift
//  chemCat
//
//  Created by lab on 3/31/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import UIKit

/* Class: DetailViewController
* Parameters: N/A
* Output: N/A
* Last Modified: 5/6/15
* Author: ???
* Purpose: Shows and maintains content for chemical list
*/
class DetailViewController: UIViewController {
    // creates instance of singleton
    var theInventoryModel: sharedInventoryModel = sharedInventoryModel.theSharedInventoryModel
    
    // preps variables for table use
    let simpleTableIdentifier = "SimpleTableIdentifier"
    var displayList = []
    
    // connects items in view to code
    @IBOutlet weak var addItemUIBarButton: UIBarButtonItem!
    @IBOutlet weak var prevUIBarButton: UIBarButtonItem!
    
    /* Func: addItemUIBarButtonOnPress
    * Parameters: sender from barButtonItem
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Rob
    * Purpose: Performs segue to add chemicla page on press
    */
    @IBAction func addItemUIBarButtonOnPress(sender: UIBarButtonItem) {
        if theInventoryModel.admin == true {
            performSegueWithIdentifier("addChemicals", sender: sender)
        }
    }
    
    /* Func: prevUIBarButtonPress
    * Parameters: sender from BarButtonItem
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Rob
    * Purpose: performs segue to previous page
    */
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
    
    /* Func: viewDidLoad()
    * Parameters: N/A
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Josh
    * Purpose: initialises information on page.
    */
    override func viewDidLoad() {
        
        displayList = theInventoryModel.chemicalList
        if theInventoryModel.admin == false {
            addItemUIBarButton.title = "[not an admin]"
            addItemUIBarButton.tintColor = UIColor.redColor()
        }
        println(theInventoryModel.mode)
        println(displayList.count)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // THE FOLLOWING FUNCTIONS PREPARE THE TABLE VIEW
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayList.count
    }
    
    
    
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as? UITableViewCell
        if (cell == nil){
            cell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:simpleTableIdentifier)
        }
        //        let image = UIImage(named: "star")
        //        cell!.imageView?.image = image
        //        let highlightedImage = UIImage(named: "star")
        //        cell!.imageView?.image = highlightedImage
        
        //cell?.textLabel?.text = string(displayList[indexPath.row])
        cell?.textLabel?.text = String((displayList[indexPath.row] as Chemical).name)
        cell?.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        
        return cell!
    }


    

}

