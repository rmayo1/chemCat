//
//  MasterViewController.swift
//  chemCat
//
//  Created by lab on 3/31/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import UIKit

/* Class: MasterViewController
* Parameters: N/A
* Output: N/A
* Last Modified: 5/6/15
* Author: ???
* Purpose: Hosts table view for inventory hub page and relative functions.
*/
class MasterViewController: UITableViewController {
    // initializes array for use to determine size of table
    var objects = NSMutableArray()

    /* Func: awakeFromNib
    * Parameters: N/A
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: ???
    * Purpose: initializes state information after objects have been loaded from an Interface Builder archive
    */
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /* Func: viewDidLoad()
    * Parameters: N/A
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: ???
    * Purpose: initialises information on page.
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* Func: insertNewObject
    * Parameters: Sender
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: ???
    * Purpose: Adds object at index within table. Updates table
    */
    func insertNewObject(sender: AnyObject) {
        objects.insertObject(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues
    
    /* Func: prepareForSegue
    * Parameters: segue, sender object
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: ???
    * Purpose: Grabs information of selected item durng segue for loading detailView
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = objects[indexPath.row] as NSDate
            (segue.destinationViewController as DetailViewController).detailItem = object
            }
        }
    }

    // MARK: - Table View
    
    // The following functions prepare the tableView, load its content.
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        let object = objects[indexPath.row] as NSDate
        cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

