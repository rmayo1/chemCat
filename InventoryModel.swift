//
//  InventoryModel.swift
//  chemCat
//
//  Created by Grayson Wilkins on 4/12/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import Foundation

class InventoryModel {
    
    var chemicals : [Chemical]
    var equipment : [Equipment]
    var outItems : [LabMaterial]
    
    init() {
        chemicals = []
        equipment = []
        outItems = []
    }
    
    func add(newItem: LabMaterial) {
        
    }
    
    func remove(oldItem: LabMaterial) {
        
    }
    
    func checkOut(inItem: LabMaterial) {
        
    }
    
    func checkIn(outItem: LabMaterial) {
        
    }
    
    func orderItem(emptyItem: LabMaterial) {
        
    }
}