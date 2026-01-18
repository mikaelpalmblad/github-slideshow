//
//  BoxDetailView.swift
//  BoxInventoryApp
//
//  Detaljvy för en specifik låda
//

import SwiftUI

struct BoxDetailView: View {
    let box: Box
    @ObservedObject var dataStore: DataStore
    @State private var showingAddItem = false
    @State private var editedBox: Box

    init(box: Box, dataStore: DataStore) {
        self.box = box
        self.dataStore = dataStore
        _editedBox = State(initialValue: box)
    }

    var body: some View {
        List {
            Section(header: Text("Lådinfo")) {
                HStack {
                    Text("Nummer:")
                    Spacer()
                    Text("\(editedBox.number)")
                        .foregroundColor(.secondary)
                }
                TextField("Namn", text: $editedBox.name)
                    .onChange(of: editedBox.name) { _ in
                        dataStore.updateBox(editedBox)
                    }
            }

            Section(header: Text("Innehåll (\(editedBox.items.count) items)")) {
                if editedBox.items.isEmpty {
                    Text("Inga items än")
                        .foregroundColor(.secondary)
                        .italic()
                } else {
                    ForEach(editedBox.items) { item in
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(item.name)
                                    .font(.headline)
                                Spacer()
                                Text("\(item.quantity) st")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            if !item.description.isEmpty {
                                Text(item.description)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                    .onDelete { offsets in
                        dataStore.deleteItem(from: editedBox, at: offsets)
                        if let updatedBox = dataStore.boxes.first(where: { $0.id == box.id }) {
                            editedBox = updatedBox
                        }
                    }
                }
            }
        }
        .navigationTitle("Låda \(editedBox.number)")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingAddItem = true }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddItem) {
            AddItemView(box: editedBox, dataStore: dataStore, isPresented: $showingAddItem)
        }
        .onAppear {
            if let updatedBox = dataStore.boxes.first(where: { $0.id == box.id }) {
                editedBox = updatedBox
            }
        }
    }
}

struct AddItemView: View {
    let box: Box
    @ObservedObject var dataStore: DataStore
    @Binding var isPresented: Bool

    @State private var itemName = ""
    @State private var itemQuantity = "1"
    @State private var itemDescription = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Lägg till item")) {
                    TextField("Namn", text: $itemName)
                    TextField("Antal", text: $itemQuantity)
                        .keyboardType(.numberPad)
                    TextField("Beskrivning (valfritt)", text: $itemDescription)
                }
            }
            .navigationTitle("Nytt Item")
            .navigationBarItems(
                leading: Button("Avbryt") { isPresented = false },
                trailing: Button("Spara") {
                    if let quantity = Int(itemQuantity), !itemName.isEmpty {
                        let newItem = BoxItem(
                            name: itemName,
                            quantity: quantity,
                            description: itemDescription
                        )
                        dataStore.addItem(to: box, item: newItem)
                        isPresented = false
                    }
                }
                .disabled(itemName.isEmpty || itemQuantity.isEmpty)
            )
        }
    }
}
