//
//  EquipmentModel.swift
//  chemCat
//
//  Created by Grayson Wilkins on 4/12/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import Foundation

/* Class: Equipment
* Last Modified: 4/30/15
* Author: Grayson
* Purpose: Creates and maintains equipment class, provides functions for it.
*/
class Equipment : LabMaterial {
    // extends off lab materials
    var condition : String
    var breakable : Bool
    
    /* init
    * Last Modified: 4/30/15
    * Parameters: integer for barcode, int for quantity, list of strings of user names, string for its condition, nooleanif breakable or not
    * Author: Grayson
    * Purpose: Initializes equipment class
    */
    init(barcode:Int, name:String, stock:Int, userNames: [String], condition:String, breakable:Bool) {
        //assigns parameters
        self.condition = condition
        self.breakable = breakable
        super.init(barcode: barcode, name: name, stock: stock, userNames: [])
    }
    
    /* Function: isBreakable
    * Output: boolean describing if equipment is broken
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: Returns if unit is breakable
    */
    func isBreakable() -> Bool {
        return self.breakable
    }
    
    /* Function: getCondition
    * Output: boolean describing condition of item
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: Returns if condition
    */
    func getCondition() -> String {
        return self.condition
    }
    
    /* Function: getStock
    * Output: integer describing quality of stock
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: returns quantity of equipment
    */
    func getStock() -> Int {
        return self.stock
    }
    
}