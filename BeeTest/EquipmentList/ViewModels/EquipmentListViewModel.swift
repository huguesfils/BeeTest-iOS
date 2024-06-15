//
//  EquipmentListViewModel.swift
//  BeeTest
//
//  Created by Hugues Fils on 12/06/2024.
//

import Foundation

class EquipmentListViewModel: ObservableObject {
    @Published var equipments: [Equipment] = []
    
    init() {
        sortEquipmentsAlphabetically()
    }
    
    private func sortEquipmentsAlphabetically() {
        equipments = EquipmentDatasource.getEquipmentsData()
        equipments.sort { $0.name < $1.name }
    }
}
