//
//  BeeTestViewModelsTest.swift
//  BeeTestTests
//
//  Created by Hugues Fils on 12/06/2024.
//

import XCTest
@testable import BeeTest

final class BeeTestViewModelsTest: XCTestCase {

    func testEquipmentListViewModel() {
            let viewModel = EquipmentListViewModel()
            XCTAssertFalse(viewModel.equipments.isEmpty)
            XCTAssertEqual(viewModel.equipments.count, 6)
        }
    
    func testEquipmentDetailViewModel() {
        let equipment = Equipment(id: "0001", name: "Chauffe-eau RDC", type: "Chauffe-eau", icon: "🔥")
            let viewModel = EquipmentDetailViewModel(equipment: equipment)
            XCTAssertEqual(viewModel.equipment.id, "0001")
            XCTAssertEqual(viewModel.equipment.name, "Chauffe-eau RDC")
            XCTAssertEqual(viewModel.equipment.type, "Chauffe-eau")
            XCTAssertEqual(viewModel.equipment.icon, "🔥")
        }
}
