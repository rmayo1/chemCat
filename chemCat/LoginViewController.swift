//
//  LoginViewController.swift
//  chemCat
//
//  Created by lab on 3/31/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import Foundation
import UIKit

/* Class: LoginViewController
* Parameters: N/A
* Output: N/A
* Last Modified: 5/6/15
* Author: Joe "The Real Deal" Delia
* Purpose: Sets up and maintains content/functions for Login page
*/
class LoginViewController: UIViewController {
    // initialises variables from the login view
    @IBOutlet weak var uname_field: UITextField!
    @IBOutlet weak var pword_field: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var desc_field: UITextView!
    
    // creates instance of singleton for use in this view
    var theInventoryModel: sharedInventoryModel = sharedInventoryModel.theSharedInventoryModel
    
    /* func: logInButtonClick
    * Parameters: sender
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Joe "The Real Deal" Delia
    * Purpose: Checks username and password, logs in. Changes to admin features if admin
    */
    @IBAction func loginButtonClick(sender: AnyObject) {
        // grabs username and password strings
        let uname = String(uname_field.text as NSString)
        let pword = String(pword_field.text as NSString)
        // makes admin if both fields are empty, else proceeds to next screen as user
        if uname == "" && pword == ""{
            theInventoryModel.admin=true
            self.performSegueWithIdentifier("successful_login", sender: self)
        }else{
            self.performSegueWithIdentifier("successful_login", sender: self)
            
        }
    }
    
    /* func: viewDidLoad
    * Parameters: N/A
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Joe "The Real Deal" Delia
    * Purpose: initialises content
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
