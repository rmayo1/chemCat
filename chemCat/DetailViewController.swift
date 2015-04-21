//
//  DetailViewController.swift
//  chemCat
//
//  Created by lab on 3/31/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var theInventoryModel: sharedInventoryModel = sharedInventoryModel.theSharedInventoryModel
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
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theInventoryModel.chemicalList.count
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
        println(theInventoryModel.mode)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

