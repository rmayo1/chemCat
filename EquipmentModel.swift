//
//  EquipmentModel.swift
//  chemCat
//
//  Created by Grayson Wilkins on 4/12/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import Foundation

class Equipment : LabMaterial {
    
    var condition : String
    var breakable : Bool
    
    init(barcode:Int, name:String, stock:Int, condition:String, breakable:Bool) {
        self.condition = condition
        self.breakable = breakable
        super.init(barcode: barcode, name: name, stock: stock)
    }
    
    func isBreakable() -> Bool {
        return self.breakable
    }
    
    func getCondition() -> String {
        return self.condition
    }
    
    func getAmount() -> String {
        return String(self.stock)
    }
    
}