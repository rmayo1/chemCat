//
//  LabMaterialModel.swift
//  chemCat
//
//  Created by Grayson Wilkins on 4/12/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import Foundation

/* Class: LabMaterial
* Last Modified: 4/30/15
* Author: Grayson
* Purpose: Creates and maintains lab material class
*/
class LabMaterial {
    // delcares variables
    var barcode : Int
    var name : String
    var stock : Int
    var userNames : [String]
    
    /* init
    * Parameters: integer for barcode, stirng for item name, int for stock quantity, list of stirngs for user name
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: initializes variables of the class
    */
    init(barcode:Int, name:String, stock:Int, userNames:[String]){
        self.barcode = barcode
        self.name = name
        self.stock = stock
        self.userNames = []
    }
    
    /* Function: getName
    * Parameters: string for name
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: returns name of item
    */
    func getName() -> String {
        return self.name
    }
    
    /* Function: getUsers
    * Parameters: string for userNames
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: returns names of the users
    */

    func getUsers() -> [String] {
        return self.userNames
    }
    
}