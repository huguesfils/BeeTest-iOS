//
//  EquipmentDetailView.swift
//  BeeTest
//
//  Created by Hugues Fils on 12/06/2024.
//

import SwiftUI

struct EquipmentDetailView: View {
    @ObservedObject var viewModel: EquipmentDetailViewModel

    var body: some View {
        List {
            Section {
                HStack {
                    Text("Nom:")
                        .bold()
                    Text(viewModel.equipment.name)
                        .accessibilityIdentifier("equipmentName")
                }
                HStack {
                    Text("Type:")
                        .bold()
                    Text(viewModel.equipment.type)
                        .accessibilityIdentifier("equipmentType")
                }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .accessibilityIdentifier("equipmentDetail")
    }
}

#Preview {
    EquipmentDetailView(viewModel: EquipmentDetailViewModel(
        equipment: Equipment(id: "0001", name: "Chauffe-eau RDC", type: "Chauffe-eau", icon: "🚀")))
}
