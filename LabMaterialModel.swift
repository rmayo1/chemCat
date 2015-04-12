//
//  LabMaterialModel.swift
//  chemCat
//
//  Created by Grayson Wilkins on 4/12/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import Foundation

class LabMaterial {
    
    var barcode : Int
    var name : String
    var stock : Int
    var userNames : [String]
    
    init(barcode:Int, name:String, stock:Int){
        self.barcode = barcode
        self.name = name
        self.stock = stock
        self.userNames = []
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getStock() -> Int {
        return self.stock
    }
    
    func getUsers() -> [String] {
        return self.userNames
    }
    
}