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
          
          XCTAssertTrue(firstEquipmentCell.exists)
          
          // Tape sur le premier équipement pour voir les détails
          firstEquipmentCell.children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
          
          XCTAssertTrue(app.collectionViews["equipmentDetail"].exists)

          // Vérifie que les détails de l'équipement sont affichés correctement
          let equipmentName = app.staticTexts["equipmentName"]
          let equipmentType = app.staticTexts["equipmentType"]
          
          XCTAssertTrue(equipmentName.exists)
          XCTAssertTrue(equipmentType.exists)
          
          // Vérifie les valeurs spécifiques des données simulées
          XCTAssertEqual(equipmentName.label, "Test Equipment 1")
          XCTAssertEqual(equipmentType.label, "Test Type 1")
      }
  }
