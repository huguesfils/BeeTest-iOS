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
        self.equipments = EquipmentDatasource.getEquipmentsData()
    }
}
