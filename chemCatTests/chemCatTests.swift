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
        let v5 = CatalogDetailViewController()
        
        XCTAssertNotNil(v1.view, "MasterView Did Not Load")
        XCTAssertNotNil(v2.view, "DetailView Did Not Load")
        XCTAssertNotNil(v3.view, "LoginView Did Not Load")
        XCTAssertNotNil(v4.view, "CatalogView Did Not Load")
        XCTAssertNotNil(v5.view, "CatalogDetailView Did Not Load")
    }
    
    func testLabMaterialModel() {
        let name = "hydrochloric acid"
        let barcode = 123
        let stock = 5
        
        var myLabMaterial = LabMaterial(barcode: barcode, name: name, stock: stock, userNames: [])
        
        XCTAssertNotNil(myLabMaterial, "LabMaterial was created successfully")
        XCTAssertTrue(myLabMaterial.getName() = name, "Name matches input")
        XCTAssertTrue(myLabMaterial.getUsers() = [], "User names match input")
        
    }
    
    func testChemicalModel() {
        var name = "hydrochloric acid"
        var barcode = 123
        var stock = 50
        var units = "mL"
        var expDate = 2016
        var ehs = true
        
        var myChemical = Chemical(barcode: barcode, name: name, stock: stock, userNames: [], expDate: expDate, units: units, ehs: ehs)
        
        XCTAssertNotNil(myChemical, "Chemical was created successfully")
        XCTAssertTrue(myChemical.getAmount() = "50mL", "Amount matches inputs")
        XCTAssertTrue(myChemical.getEhsStatus() = ehs, "EHS status matches input")
        XCTAssertTrue(myChemical.getExpDate() = expDate, "Expiration date matches input")
        
    }
    
    func testEquipModel() {
        var name = "graduated cylinder"
        var barcode = 456
        var stock = 5
        var condition = "New"
        var breakable = true
        
        var myEquipment = Equipment(barcode: barcode, name: name, stock: stock, userNames: [], condition: condition, breakable: breakable)
        
        XCTAssertNotNil(myEquipment, "Equipment was created successfully")
        XCTAssertTrue(myEquipment.getStock() = stock, "Stock maches input")
        XCTAssertTrue(myEquipment.getCondition() = condition, "Condition matches input")
        XCTAssertTrue(myEquipment.isBreakable() = breakable, "Equipment is breakable")
        
    }
    
    func testInventoryModel() {
        
        var myInventory = InventoryModel()
        
        XCTAssertNotNil(myInventory, "Inventory was created successfully")
        XCTAssertNotNil(myInventory.addChemical(myChemical), "Chemical was added")
        XCTAssertNotNil(myInventory.addEquipment(myEquipment), "Equipment was added")
        XCTAssertNotNil(myInventory.checkOutChem(myChemical), "Chemical was checked out")
        XCTAssertNotNil(myInventory.checkOutEq(myEquipment), "Equipment was checked out")
        XCTAssertNotNil(myInventory.checkInChem(myChemical), "Chemical was checked in")
        XCTAssertNotNil(myInventory.checkInEq(myEquipment), "Equipment was checked in")
        
    }
    
}
