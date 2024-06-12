//

import XCTest

final class BeeTestUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }

    func testEquipmentListView() throws {
        let app = XCUIApplication()
        
        sleep(5)
        
        let equipmentList = app.tables["equipmentList"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: equipmentList, handler: nil)
        
        let result = XCTWaiter.wait(for: [expectation(description: "Wait for equipmentList to appear")], timeout: 10)
        if result == .completed {
            XCTAssertTrue(equipmentList.cells.count > 0)
            XCTAssertTrue(app.staticTexts["equipment_0001"].exists)
        } else {
            XCTFail("Failed to find equipmentList in time")
        }
    }

    func testEquipmentDetailView() throws {
        let app = XCUIApplication()
        
        sleep(5)
        
        let equipmentList = app.tables["equipmentList"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: equipmentList, handler: nil)
        
        let result = XCTWaiter.wait(for: [expectation(description: "Wait for equipmentList to appear")], timeout: 10)
        if result == .completed {
            let firstCell = equipmentList.cells.element(boundBy: 0)
            firstCell.tap()
            
            let detailsView = app.otherElements["equipmentDetail"]
            expectation(for: exists, evaluatedWith: detailsView, handler: nil)
            let detailsResult = XCTWaiter.wait(for: [expectation(description: "Wait for equipmentDetail to appear")], timeout: 10)
            if detailsResult == .completed {
                XCTAssertTrue(app.staticTexts["equipmentName"].exists)
                XCTAssertTrue(app.staticTexts["equipmentType"].exists)
            } else {
                XCTFail("Failed to find equipmentDetail in time")
            }
        } else {
            XCTFail("Failed to find equipmentList in time")
        }
    }
}
