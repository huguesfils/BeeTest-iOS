//

import Foundation

class EquipmentDatasource {
    static var useMockData = false
    
    static func getEquipmentsData() -> [Equipment] {
        if useMockData {
            return [
                Equipment(id: "1", name: "Test Equipment 1", type: "Test Type 1", icon: "🚀"),
                Equipment(id: "2", name: "Test Equipment 2", type: "Test Type 2", icon: "🚀")
            ]
        } else {
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
}
