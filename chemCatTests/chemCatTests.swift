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
    
    func testChemicalModel() {
        let name = "hydrochloric acid"
        let barcode = 123
        let stock = 5
        let units = "mL"
        let expDate = 2016
        let ehs = true
        
        Chemical(barcode: barcode, name: name, stock: stock, expDate: expDate, units: units, ehs: ehs)
        
        //XCTAssertTrue(<#expression: @autoclosure () -> BooleanType#>, <#message: String#>)
        
    }
    
}
