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
//Class: sharedSongModel
//Author: Josh
//Last Modified: 2/24/15
//Purpose: singleton that holds the master song list, album list, playlist lists.
//Allows sharing of info between the view controllers
//Parameters: none
class sharedInventoryModel {
    // Initalize the singeton instances for shared data
    var chemicalList: [Chemical]//master list of songs
    var equipmentList: [Equipment]//master list of playlists
    var outItemsList: [LabMaterial]//master list of albums
    var mode:String
    var admin:Bool
    
    
    // sharedSongModel Constructor
    // Author: Josh
    // Last Modified: 3/1/15]
    // Purpose: Initializes instance reference of sharedSongModel
    init(){
        admin=false
        mode=""
        equipmentList = [Equipment]()//view controlers will reference this same instance for albumList
        outItemsList = [LabMaterial]()//view controllers will reference this same instace for playlistList
        chemicalList = [Chemical]()//view controllers will reference this same instance for songList
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
        //addEquipment(myEquipment3)
    }
    
    func addChemical(newChemical:Chemical){
        chemicalList.append(newChemical)
    }
    
    func addEquipment(newEquipment:Equipment){
        equipmentList.append(newEquipment)
    }
    
    func removeChem(oldItem: Chemical) {
        var count = 0
        for Chemical in chemicalList{
            if Chemical.getName() == oldItem.getName(){
                chemicalList.removeAtIndex(count)
            }
            count++
        }
    }
    
    func removeEq(oldItem: Equipment) {
        var count = 0
        for Equipment in equipmentList{
            if Equipment.getName() == oldItem.getName(){
                equipmentList.removeAtIndex(count)
            }
            count++
        }
    }
    
    func removeOutItem(returnItem: LabMaterial) {
        var count = 0
        for LabMaterial in outItemsList{
            if LabMaterial.getName() == returnItem.getName(){
                outItemsList.removeAtIndex(count)
            }
            count++
        }
    }
    
    func checkOutChem(inItem: Chemical) {
        removeChem(inItem)
        outItemsList.append(inItem)
    }
    
    func checkInChem(outItem: Chemical) {
        removeOutItem(outItem)
        chemicalList.append(outItem)
    }
    
    func checkOutEq(inItem: Equipment) {
        removeEq(inItem)
        outItemsList.append(inItem)
    }
    
    func checkInEq(outItem: Equipment) {
        removeOutItem(outItem)
        equipmentList.append(outItem)
    }
    
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