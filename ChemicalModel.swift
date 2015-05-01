//
//  ChemicalModel.swift
//  chemCat
//
//  Created by Grayson Wilkins on 4/12/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import Foundation

/* Class: Chemical
 * Last Modified: 4/30/15
 * Author: Grayson
 * Purpose: Serves to build and maintain chemical
 */
class Chemical : LabMaterial {
    // extends on LabMaterial class
    var ehs : Bool
    var expDate : Int
    var units : String
    
    /* init
    * Parameters: int for barcode, string for name of chemical, int for total stock, list of user name strings, int for expiration date, string for units, boolean for if dangerous
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: Serves to build and maintain chemical
    */
    init(barcode:Int, name:String, stock:Int, userNames: [String], expDate:Int, units:String, ehs:Bool) {
        //initializes values of class
        self.ehs = ehs
        self.expDate = expDate
        self.units = units
        super.init(barcode: barcode, name: name, stock: stock, userNames: [])
    }
    
    /* Function: getEHSStatus
    * Output: boolean describing if it is on a EHS watchlist
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: Returns EHS status
    */
    func getEhsStatus() -> Bool {
        return self.ehs
    }
    
    /* Function: getExpDate
    * Output: integer corresponding to year the chemical expires.
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: Returns expiration date of chemical
    */
    func getExpDate() -> Int {
        return self.expDate
    }
    
    /* Function: getAmount
    * Output: string of remaining chemical if its units
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: returns chemical quantity
    */
    func getAmount() -> String {
        return String(self.stock) + self.units
    }
    
}