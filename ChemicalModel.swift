//
//  ChemicalModel.swift
//  chemCat
//
//  Created by Grayson Wilkins on 4/12/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import Foundation

class Chemical : LabMaterial {
    
    var ehs : Bool
    var expDate : Int
    var units : String
    
    init(barcode:Int, name:String, stock:Int, userNames: [String], expDate:Int, units:String, ehs:Bool) {
        self.ehs = ehs
        self.expDate = expDate
        self.units = units
        super.init(barcode: barcode, name: name, stock: stock, userNames: [])
    }
    
    func getEhsStatus() -> Bool {
        return self.ehs
    }
    
    func getExpDate() -> Int {
        return self.expDate
    }
    
    func getAmount() -> String {
        return String(self.stock) + self.units
    }
    
}