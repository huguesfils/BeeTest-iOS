//
//  EquipmentDetailViewModel.swift
//  BeeTest
//
//  Created by Hugues Fils on 12/06/2024.
//

import Foundation

class EquipmentDetailViewModel: ObservableObject {
    var equipment: Equipment
    
    init(equipment: Equipment) {
        self.equipment = equipment
    }
}
