//
//  sharedInventoryModel.swift
//  chemCat
//
//  Created by Joshua Chang on 4/15/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import Foundation

import Foundation

private let _inventoryModelSharedInstance = sharedInventoryModel()
/* Class: sharedInventoryModel
* Parameters: N/A
* Output: N/A
* Last Modified: 5/6/15
* Author: Josh
* Purpose: Holds shared variables and lists
*/
class sharedInventoryModel {
    // Initalize the singeton instances for shared data
    var chemicalList: [Chemical] //list of chemical
    var equipmentList: [Equipment] //list of equipments
    var outItemsList: [LabMaterial] //list of labMaterials
    var mode:String //mode, or current list viewed
    var admin:Bool
    
    
    /* func: init
    * Parameters: N/A
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Josh
    * Purpose: Sets values to all variables, sets some lists up with chemicals.
    */
    init(){
        admin=false
        mode=""
        equipmentList = [Equipment]()
        outItemsList = [LabMaterial]()
        chemicalList = [Chemical]()
        let myChemical1 = Chemical(barcode: 10000001, name: "Hydrochloric Acid", stock: 25, userNames: [], expDate: 2018, units: "ml", ehs: true)
        let myChemical2 = Chemical(barcode: 10000002, name: "Dihydrogen Monoxide", stock: 50, userNames: [], expDate: 2100, units: "liters", ehs: false)
        let myChemical3 = Chemical(barcode: 10000003, name: "Potassium Deliaite", stock: 100, userNames: [], expDate: 2015, units: "ml", ehs: true)
        addChemical(myChemical1)
        addChemical(myChemical2)
        addChemical(myChemical3)
        let myEquipment1 = Equipment(barcode: 20000001, name: "50ml Graduated Cylinder", stock: 1, userNames: [], condition: "like-new", breakable: true)
        let myEquipment2 = Equipment(barcode: 20000002, name: "Beaker", stock: 3, userNames: [], condition: "worn", breakable: true)
        let myEquipment3 = Equipment(barcode: 20000003, name: "Goggles", stock: 10, userNames: [], condition: "like-new", breakable: false)
        addEquipment(myEquipment1)
        addEquipment(myEquipment2)
    }
    
    /* func: addChemical
    * Parameters: chemical to be added
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Grayson
    * Purpose: adds chemical to its list
    */
    func addChemical(newChemical:Chemical){
        chemicalList.append(newChemical)
    }
    
    /* func: addEquipment
    * Parameters: cequipment to be added
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Grayson
    * Purpose: adds equipment to its list
    */
    func addEquipment(newEquipment:Equipment){
        equipmentList.append(newEquipment)
    }
    
    /* func: removeChemical
    * Parameters: chemical to be removed
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Grayson
    * Purpose: removes chemical from its list
    */
    func removeChem(oldItem: Chemical) {
        var count = 0
        for Chemical in chemicalList{
            if Chemical.getName() == oldItem.getName(){
                chemicalList.removeAtIndex(count)
            }
            count++
        }
    }
    
    /* func: removeEquipment
    * Parameters: equipment to be removed
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Grayson
    * Purpose: remove Equipment from its list
    */
    func removeEq(oldItem: Equipment) {
        var count = 0
        for Equipment in equipmentList{
            if Equipment.getName() == oldItem.getName(){
                equipmentList.removeAtIndex(count)
            }
            count++
        }
    }
    
    /* func: removeOutItem
    * Parameters: labMaterial returned
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Grayson
    * Purpose: removes given item from outventory
    */
    func removeOutItem(returnItem: LabMaterial) {
        var count = 0
        for LabMaterial in outItemsList{
            if LabMaterial.getName() == returnItem.getName(){
                outItemsList.removeAtIndex(count)
            }
            count++
        }
    }
    
    /* func: checkOutChemical
    * Parameters: chemical
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Grayson
    * Purpose: removes chemical for inventory, adds to outventory
    */
    func checkOutChem(inItem: Chemical) {
        removeChem(inItem)
        outItemsList.append(inItem)
    }
    
    /* func: checkInChemical
    * Parameters: chemical
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Grayson
    * Purpose: removes chemical from outventory, adds back to inventory
    */
    func checkInChem(outItem: Chemical) {
        removeOutItem(outItem)
        chemicalList.append(outItem)
    }
    
    /* func: checkOutEq
    * Parameters: equipment
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Grayson
    * Purpose: removes equipment for inventory, adds to outventory
    */
    func checkOutEq(inItem: Equipment) {
        removeEq(inItem)
        outItemsList.append(inItem)
    }
    
    /* func: checkInEq
    * Parameters: equipment
    * Output: N/A
    * Last Modified: 5/6/15
    * Author: Grayson
    * Purpose: removes equipment from outventory, adds to inventory
    */
    func checkInEq(outItem: Equipment) {
        removeOutItem(outItem)
        equipmentList.append(outItem)
    }
    
    /* func: getChemical
    * Parameters: chemical
    * Output: boolean
    * Last Modified: 5/6/15
    * Author: Grayson
    * Purpose: checks to see if chemical is in list, returns true if so
    */
    func getChemical(chem: Chemical) -> Bool{
        for Chemical in chemicalList {
            if Chemical.getName() == chem.getName() {
                return true
            }
        }
        return false
    }
    
    /* func: getEquipment
    * Parameters: equipment
    * Output: boolean
    * Last Modified: 5/6/15
    * Author: Grayson
    * Purpose: checks to see if equipment is in list, returns true if so
    */
    func getEquipment(eq: Equipment) -> Bool {
        for Equipment in equipmentList {
            if Equipment.getName() == eq.getName() {
                return true
            }
        }
        return false
    }
    
    /* func: getOutItem
    * Parameters: labMaterial
    * Output: boolean
    * Last Modified: 5/6/15
    * Author: Grayson
    * Purpose: checks to see if labMaterical is in outventory list, returns true if so
    */
    func getOutItem(out: LabMaterial) -> Bool {
        for LabMaterial in outItemsList {
            if LabMaterial.getName() == out.getName() {
                return true
            }
        }
        return false
    }
    /* func: orderItem
    * Parameters: labMaterial
    * Output: string
    * Last Modified: 5/6/15
    * Author: Grayson
    * Purpose: WIP
    */
    func orderItem(emptyItem: LabMaterial) -> String{
        //code to open up vendor's order form in browser
        //openURL(NSURL(string: "http://www.google.com"))
        
        return emptyItem.getName() + " was ordered."
    }
    //return this sharedSongModel instance
    class var theSharedInventoryModel: sharedInventoryModel {
        return _inventoryModelSharedInstance
    }

}