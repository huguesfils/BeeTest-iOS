//

import XCTest
@testable import BeeTest

final class BeeTestModelTests: XCTestCase {
    
    func testEquipmentModelDecoding() {
        let json = """
           [
               {
                   "id": "0001",
                   "name": "Chauffe-eau RDC",
                   "type": "Chauffe-eau",
           "icon": "🔥"
               }
           ]
           """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        do {
            let equipments = try decoder.decode([Equipment].self, from: json)
            XCTAssertEqual(equipments.count, 1)
            XCTAssertEqual(equipments.first?.id, "0001")
            XCTAssertEqual(equipments.first?.name, "Chauffe-eau RDC")
            XCTAssertEqual(equipments.first?.type, "Chauffe-eau")
            XCTAssertEqual(equipments.first?.icon, "🔥")
        } catch {
            XCTFail("Decoding failed: \(error)")
        }
    }
    
    func testEquipmentDatasource() {
        let equipments = EquipmentDatasource.getEquipmentsData()
        XCTAssertFalse(equipments.isEmpty)
        XCTAssertEqual(equipments.count, 6)
    }
}

