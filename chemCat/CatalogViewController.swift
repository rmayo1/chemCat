//
//  CatalogViewController.swift
//  chemCat
//
//  Created by lab on 4/2/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import UIKit


class CatalogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var nextUIBarButton: UIBarButtonItem!
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("toItems", sender: self)
    }
    
    
    var objects = NSMutableArray()
    private let categories = [
        "Chemicals", "Tools", "Equipment"]
    let simpleTableIdentifier = "SimpleTableIdentifier"

    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var theInventoryModel: sharedInventoryModel = sharedInventoryModel.theSharedInventoryModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as? UITableViewCell
        if (cell == nil){
            cell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:simpleTableIdentifier)
            cell!.textLabel?.text = categories[indexPath.row]
        }
//        let image = UIImage(named: "star")
//        cell!.imageView?.image = image
//        let highlightedImage = UIImage(named: "star")
//        cell!.imageView?.image = highlightedImage
        
        cell?.textLabel?.text = categories[indexPath.row]
        cell?.textLabel?.font = UIFont.boldSystemFontOfSize(10)
        
        return cell!
    }
}
