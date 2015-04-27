//
//  LoginViewController.swift
//  chemCat
//
//  Created by lab on 3/31/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var uname_field: UITextField!
    @IBOutlet weak var pword_field: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var desc_field: UITextView!
    var theInventoryModel: sharedInventoryModel = sharedInventoryModel.theSharedInventoryModel
    
    
    @IBAction func loginButtonClick(sender: AnyObject) {
        let uname = String(uname_field.text as NSString)
        let pword = String(pword_field.text as NSString)
        //
        if uname == "" && pword == ""{
            theInventoryModel.admin=true
            self.performSegueWithIdentifier("successful_login", sender: self)
        }else{
            self.performSegueWithIdentifier("successful_login", sender: self)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
