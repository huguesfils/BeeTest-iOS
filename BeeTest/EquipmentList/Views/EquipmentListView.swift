//

import SwiftUI

struct EquipmentListView: View {
    @StateObject private var viewModel = EquipmentListViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.equipments) { equipment in
                NavigationLink(destination: EquipmentDetailView(
                    viewModel: EquipmentDetailViewModel(equipment: equipment))) {
                        HStack {
                            Text(equipment.icon)
                            Text(equipment.name)
                                    .font(.title3)
                                .accessibilityIdentifier("equipment_\(equipment.id)")
                        }
                   
                }
            }
            .navigationTitle("Equipements")
            .accessibilityIdentifier("equipmentList")
        }
    }
}

#Preview {
    EquipmentListView()
}
