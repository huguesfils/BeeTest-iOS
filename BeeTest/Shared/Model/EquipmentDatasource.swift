//

import Foundation

class EquipmentDatasource {
    static func getEquipmentsData() -> [Equipment] {
        guard let path = Bundle.main.url(forResource: "Equipments", withExtension: "json") else {
            fatalError("Equipments.json file not found")
        }
        
        let data: Data
        
        do {
            data = try Data(contentsOf: path)
        } catch {
            fatalError("Unable to read Equipments.json file: \(error)")
        }
        
        let equipments: [Equipment]
        
        do {
            equipments = try JSONDecoder().decode([Equipment].self, from: data)
        } catch {
            fatalError("Unable to decode Equipments.json file: \(error)")
        }
        
        return equipments
    }
}
