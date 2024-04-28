//

import SwiftUI

struct EquipmentListView: View {
    var body: some View {
        Text("")
            .padding()
            .onAppear {
                EquipmentDatasource.getEquipmentsData()
            }
    }
}

#Preview {
    EquipmentListView()
}
