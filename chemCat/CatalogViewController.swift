//
//  CatalogViewController.swift
//  chemCat
//
//  Created by lab on 4/2/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import UIKit


class CatalogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var objects = NSMutableArray()
    private let dwarves = [
        "Sleepy", "Sneezy", "Bashful", "Happy",
        "Doc", "Grumpy", "Dopey",
        "Thorin", "Dorin", "Nori", "Ori",
        "Balin", "Dwalin", "Fili", "Kili",
        "Oin", "Gloin", "Bifur", "Bofur",
        "Bombur"]
    let simpleTableIdentifier = "SimpleTableIdentifier"

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(simpleTableIdentifier) as? UITableViewCell
        if (cell == nil){
            cell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:simpleTableIdentifier)
            cell!.textLabel?.text = dwarves[indexPath.row]
        }
//        let image = UIImage(named: "star")
//        cell!.imageView?.image = image
//        let highlightedImage = UIImage(named: "star")
//        cell!.imageView?.image = highlightedImage
        
        cell?.textLabel?.text = dwarves[indexPath.row]
        cell?.textLabel?.font = UIFont.boldSystemFontOfSize(50)
        
        return cell!
    }
}
