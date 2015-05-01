//
//  InventoryModel.swift
//  chemCat
//
//  Created by Grayson Wilkins on 4/12/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import Foundation

/* Class: InventoryModel
* Last Modified: 4/30/15
* Author: Grayson
* Purpose: creates and maintains inventory class for singleton
*/
class InventoryModel {
    // declares inventory items
    var chemicals : [Chemical]
    var equipment : [Equipment]
    var outItems : [LabMaterial]
    
    /* Class: init
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: initializes inventory lists as blank
    */
    init() {
        chemicals = []
        equipment = []
        outItems = []
    }
    
    /* Function: addChemical
    * Parameters: chemical to be added
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: appends given chemical to inventory list
    */
    func addChemical(newItem: Chemical) {
        chemicals.append(newItem)
    }
    
    /* Function: addEquipment
    * Parameters: equipment to be added
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: adds given equipment to equipment list
    */
    func addEquipment(newItem: Equipment) {
        equipment.append(newItem)
    }
    
    /* Function: removeChemical
    * Parameters: chemical to be removed
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: removes given chemical to inventory list
    */
    func removeChem(oldItem: Chemical) {
        var count = 0
        // goes through chemical list, removes chemical with same name
        for Chemical in chemicals{
            if Chemical.getName() == oldItem.getName(){
                chemicals.removeAtIndex(count)
            }
            count++
        }
    }
    
    /* Function: removeEq
    * Parameters: equipment to be removed
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: remove given equipment to equipment list
    */
    func removeEq(oldItem: Equipment) {
        var count = 0
        // goes through equipment list, removes equipment with same name
        for Equipment in equipment{
            if Equipment.getName() == oldItem.getName(){
                equipment.removeAtIndex(count)
            }
            count++
        }
    }
    
    /* Function: removeOutItem
    * Parameters: item to be removed
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: removes a given item from the list of materials out of the inventory
    */
    func removeOutItem(returnItem: LabMaterial) {
        var count = 0
        for LabMaterial in outItems{
            if LabMaterial.getName() == returnItem.getName(){
                outItems.removeAtIndex(count)
            }
            count++
        }
    }
    
    /* Function: checkOutChem
    * Parameters: inventory chemical to be removed from inventory
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: appends given chemical to OUTventory list, removes from inventory
    */
    func checkOutChem(inItem: Chemical) {
        removeChem(inItem)
        outItems.append(inItem)
    }
    
    /* Function: checkInChem
    * Parameters: inventory chemical to be added back to inventory from outventory
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: appends given chemical to inventory list, removes from outventory
    */
    func checkInChem(outItem: Chemical) {
        removeOutItem(outItem)
        chemicals.append(outItem)
    }
    
    /* Function: checkOutEq
    * Parameters: inventory equipment to be removed from equipment
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: appends given equipment to OUTventory list, removes from equipment
    */
    func checkOutEq(inItem: Equipment) {
        removeEq(inItem)
        outItems.append(inItem)
    }
    
    /* Function: checkInEq
    * Parameters: inventory equipment to be added from inventory, removed from outventory
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: appends given equipment to inventory list, removes from outventory
    */
    func checkInEq(outItem: Equipment) {
        removeOutItem(outItem)
        equipment.append(outItem)
    }
    
    /* Function: getChemical
    * Parameters: inventory chemical
    * Outputs: boolean for if found or not
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: gets a given chemical from the list of chemicals, returns boolean to see if is in list.
    */
    func getChemical(chem: Chemical) -> Bool{
        for Chemical in chemicals {
            if Chemical.getName() == chem.getName() {
                return true
            }
        }
        return false
    }
    
    /* Function: getEquipment
    * Parameters: inventory equipment
    * Outputs: boolean for if found or not
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: gets a given equipment from the list of equipments, returns boolean to see if is in list.
    */
    func getEquipment(eq: Equipment) -> Bool {
        for Equipment in equipment {
            if Equipment.getName() == eq.getName() {
                return true
            }
        }
        return false
    }
    
    /* Function: getOutItem
    * Parameters: labmaterial
    * Outputs: boolean for if found or not
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: checks outventory for an item, returns true if found.
    */
    func getOutItem(out: LabMaterial) -> Bool {
        for LabMaterial in outItems {
            if LabMaterial.getName() == out.getName() {
                return true
            }
        }
        return false
    }
    
    /* Function: orderItem
    * Parameters: labMaterial item
    * Outputs: string indicating item was ordered
    * Last Modified: 4/30/15
    * Author: Grayson
    * Purpose: Opens browser to find form for ordering. Not functional currently.
    */
    func orderItem(emptyItem: LabMaterial) -> String{
        //code to open up vendor's order form in browser
        //openURL(NSURL(string: "http://www.google.com"))
        
        return emptyItem.getName() + " was ordered."
    }
}