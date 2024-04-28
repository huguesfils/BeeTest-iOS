//

import Foundation

class EquipmentDatasource {
    
    static func getEquipmentsData() -> Data {
        let path = Bundle.main.url(forResource: "Equipments", withExtension: "json", subdirectory: nil)!
         // Bundle.main.path(forResource: "Equipments", ofType: "json")
        let data =  try! Data(contentsOf: path)
        return data
    }
}
