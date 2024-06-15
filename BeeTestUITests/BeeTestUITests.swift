//

import XCTest

final class BeeTestUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-UITest"]
        app.launch()
    }
    
    func testEquipmentDetailView() throws {
        XCTAssertTrue(app.collectionViews["equipmentList"].exists)
        
        let firstEquipmentCell = app.collectionViews["equipmentList"].children(matching: .cell).element(boundBy: 0)
        let secondEquipmentCell = app.collectionViews["equipmentList"].children(matching: .cell).element(boundBy: 1)
        XCTAssertTrue(firstEquipmentCell.exists)
        XCTAssertTrue(secondEquipmentCell.exists)
        
        let firstEquipmentName = firstEquipmentCell.staticTexts.element(matching: .any, identifier: "equipment_1").label
        let secondEquipmentName = secondEquipmentCell.staticTexts.element(matching: .any, identifier: "equipment_2").label
        XCTAssertLessThan(firstEquipmentName, secondEquipmentName)
        
        
        firstEquipmentCell.children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        XCTAssertTrue(app.collectionViews["equipmentDetail"].exists)
        
        
        let equipmentName = app.staticTexts["equipmentName"]
        let equipmentType = app.staticTexts["equipmentType"]
        XCTAssertTrue(equipmentName.exists)
        XCTAssertTrue(equipmentType.exists)
        
        XCTAssertEqual(equipmentName.label, "Test Equipment 1")
        XCTAssertEqual(equipmentType.label, "Test Type 1")
    }
}
