//
//  chemCatTests.swift
//  chemCatTests
//
//  Created by lab on 3/31/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//

import UIKit
import XCTest
import chemCat

class chemCatTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testViewDidLoad() {
        let v1 = MasterViewController()
        let v2 = DetailViewController()
        let v3 = LoginViewController()
        let v4 = CatalogViewController()
        
        XCTAssertNotNil(v1.view, "MasterView Did Not Load")
        XCTAssertNotNil(v2.view, "DetailView Did Not Load")
        XCTAssertNotNil(v3.view, "LoginView Did Not Load")
        XCTAssertNotNil(v4.view, "CatalogView Did Not Load")
    }
    
    func testLabMaterialModel() {
        var name = "hydrochloric acid"
        var barcode = 123
        var stock = 5
        var userNames = []
        
        var myLabMaterial = LabMaterial(barcode: barcode, name: name, stock: stock, userNames: [])
        
        XCTAssertNotNil(myLabMaterial, "LabMaterial was created successfully")
        XCTAssertEqual(myLabMaterial.getName(), name, "Name matches input")
        XCTAssertEqual(myLabMaterial.getUsers(), userNames, "User names match input")
    }
    
    func testChemicalModel() {
        var name = "hydrochloric acid"
        var barcode = 123
        var stock = 50
        var units = "ml"
        var expDate = 2016
        var ehs = true
        
        var myChemical = Chemical(barcode: barcode, name: name, stock: stock, userNames: [], expDate: expDate, units: units, ehs: ehs)
        
        XCTAssertNotNil(myChemical, "Chemical was created successfully")
        XCTAssertEqual(myChemical.getAmount(), "50ml", "Amount matches input")
        XCTAssertEqual(myChemical.getEhsStatus(), ehs, "EHS matches input")
        XCTAssertEqual(myChemical.getExpDate(), expDate, "Expiration date matches input")
        
    }
    
    func testEquipModel() {
        var name = "graduated cylinder"
        var barcode = 456
        var stock = 5
        var condition = "New"
        var breakable = true
        
        var myEquipment = Equipment(barcode: barcode, name: name, stock: stock, userNames: [], condition: condition, breakable: breakable)
        
        XCTAssertNotNil(myEquipment, "Equipment was created successfully")
        XCTAssertEqual(myEquipment.getStock(), stock, "Stock matches input")
        XCTAssertEqual(myEquipment.getCondition(), condition, "Condition matches input")
        XCTAssertEqual(myEquipment.isBreakable(), breakable, "Breakble status matches input")
        
    }
    
    func testInventoryModel() {
        
        var myInventory = InventoryModel()
        
        XCTAssertNotNil(myInventory, "Inventory was created successfully")
        
        var name = "hydrochloric acid"
        var barcode = 123
        var stock = 50
        var units = "ml"
        var expDate = 2016
        var ehs = true
        var condition = "New"
        var breakable = true
        
        var myChemical = Chemical(barcode: barcode, name: name, stock: stock, userNames: [], expDate: expDate, units: units, ehs: ehs)
        
        var myEquipment = Equipment(barcode: barcode, name: name, stock: stock, userNames: [], condition: condition, breakable: breakable)
        
        myInventory.addChemical(myChemical)
        myInventory.addEquipment(myEquipment)
        
        XCTAssertEqual(myInventory.getChemical(myChemical), true, "Chemical was not added")
        XCTAssertEqual(myInventory.getEquipment(myEquipment), true, "Equipment was not added")
        
        myInventory.checkOutChem(myChemical)
        XCTAssertEqual(myInventory.getOutItem(myChemical), true, "Chemical was not checked out")
        myInventory.checkInChem(myChemical)
        
        myInventory.checkOutEq(myEquipment)
        XCTAssertEqual(myInventory.getOutItem(myEquipment), true, "Equipment was not checked out")
        myInventory.checkInEq(myEquipment)
        
        myInventory.removeChem(myChemical)
        myInventory.removeEq(myEquipment)
        
        XCTAssertEqual(myInventory.getChemical(myChemical), false, "Chemical was not removed")
        XCTAssertEqual(myInventory.getEquipment(myEquipment), false, "Equipment was not removed")
        
    }
    
    func testSharedInventory() {
        
        var myInventory = sharedInventoryModel()
        
        XCTAssertNotNil(myInventory, "Inventory was created successfully")
        
        var name = "hydrochloric acid"
        var barcode = 123
        var stock = 50
        var units = "ml"
        var expDate = 2016
        var ehs = true
        var condition = "New"
        var breakable = true
        
        var myChemical = Chemical(barcode: barcode, name: name, stock: stock, userNames: [], expDate: expDate, units: units, ehs: ehs)
        
        var myEquipment = Equipment(barcode: barcode, name: name, stock: stock, userNames: [], condition: condition, breakable: breakable)
        
        myInventory.addChemical(myChemical)
        myInventory.addEquipment(myEquipment)
        
        /*XCTAssertEqual(myInventory.getChemical(myChemical), true, "Chemical was not added")
        XCTAssertEqual(myInventory.getEquipment(myEquipment), true, "Equipment was not added")
        
        myInventory.checkOutChem(myChemical)
        XCTAssertEqual(myInventory.getOutItem(myChemical), true, "Chemical was not checked out")
        myInventory.checkInChem(myChemical)
        
        myInventory.checkOutEq(myEquipment)
        XCTAssertEqual(myInventory.getOutItem(myEquipment), true, "Equipment was not checked out")
        myInventory.checkInEq(myEquipment)
        
        myInventory.removeChem(myChemical)
        myInventory.removeEq(myEquipment)
        
        XCTAssertEqual(myInventory.getChemical(myChemical), false, "Chemical was not removed")
        XCTAssertEqual(myInventory.getEquipment(myEquipment), false, "Equipment was not removed")*/
    }
    
}
