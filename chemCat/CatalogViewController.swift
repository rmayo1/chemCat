//
//  CatalogViewController.swift
//  chemCat
//
//  Created by lab on 4/2/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import UIKit

/* Class: CatalogViewController
* Parameters: N/A
* Output: N/A
* Last Modified: 5/6/15
* Author: Josh
* Purpose: Shows and maintains content for list of lists
*/
class CatalogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    /* func: tableView
    * Parameters: TableView, index selected
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Josh
    * Purpose: Segues to selected index, update singleton to newly selected mode
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        theInventoryModel.mode = categories[indexPath.row]
        performSegueWithIdentifier(theInventoryModel.mode, sender: self)
    }
    
    // creates variables for array use
    var objects = NSMutableArray()
    private let categories = [
        "Chemicals", "Tools", "Equipment"]
    let simpleTableIdentifier = "SimpleTableIdentifier"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // creates instance of singleton for use on view
    var theInventoryModel: sharedInventoryModel = sharedInventoryModel.theSharedInventoryModel
    
    /* func: viewDidLoad
    * Parameters: N/A
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Josh
    * Purpose: initalizes items in class on view
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    // THE FOLLOWING FUNCTIONS MANAGE THE TABLEVIEW'S CONTENT
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as? UITableViewCell
        if (cell == nil){
            cell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:simpleTableIdentifier)
            cell!.textLabel?.text = categories[indexPath.row]
        }
        cell?.textLabel?.text = categories[indexPath.row]
        cell?.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        
        return cell!
    }
}
