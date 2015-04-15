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
    
    func addChemical(newItem: Chemical) {
        chemicals.append(newItem)
    }
    
    func addEquipment(newItem: Equipment) {
        equipment.append(newItem)
    }
    
    func removeChem(oldItem: Chemical) {
        var count = 0
        for Chemical in chemicals{
            if Chemical.getName() == oldItem.getName(){
                chemicals.removeAtIndex(count)
            }
            count++
        }
    }
    
    func removeEq(oldItem: Equipment) {
        var count = 0
        for Equipment in equipment{
            if Equipment.getName() == oldItem.getName(){
                equipment.removeAtIndex(count)
            }
            count++
        }
    }
    
    func removeOutItem(returnItem: LabMaterial) {
        var count = 0
        for LabMaterial in outItems{
            if LabMaterial.getName() == returnItem.getName(){
                outItems.removeAtIndex(count)
            }
            count++
        }
    }
    
    func checkOutChem(inItem: Chemical) {
        removeChem(inItem)
        outItems.append(inItem)
    }
    
    func checkInChem(outItem: Chemical) {
        removeOutItem(outItem)
        chemicals.append(outItem)
    }
    
    func checkOutEq(inItem: Equipment) {
        removeEq(inItem)
        outItems.append(inItem)
    }
    
    func checkInEq(outItem: Equipment) {
        removeOutItem(outItem)
        equipment.append(outItem)
    }
    
    func orderItem(emptyItem: LabMaterial) -> String{
        //code to open up vendor's order form in browser
        //openURL(NSURL(string: "http://www.google.com"))
        
        return emptyItem.getName() + " was ordered."
    }
}