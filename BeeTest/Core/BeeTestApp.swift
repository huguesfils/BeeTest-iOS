//

import SwiftUI

@main
struct BeeTestApp: App {
    init() {
           if CommandLine.arguments.contains("-UITest") {
               EquipmentDatasource.useMockData = true
           }
       }
    var body: some Scene {
        WindowGroup {
            EquipmentListView()
        }
    }
}
