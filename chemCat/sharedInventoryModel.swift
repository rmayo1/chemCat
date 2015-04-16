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
    
    
    // sharedSongModel Constructor
    // Author: Josh
    // Last Modified: 3/1/15]
    // Purpose: Initializes instance reference of sharedSongModel
    init(){
        chemicalList = [Chemical]()//view controllers will reference this same instance for songList
        equipmentList = [Equipment]()//view controlers will reference this same instance for albumList
        outItemsList = [LabMaterial]()//view controllers will reference this same instace for playlistList
        // start with an empty song in the list
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