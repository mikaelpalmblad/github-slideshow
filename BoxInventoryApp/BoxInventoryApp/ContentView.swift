//
//  ContentView.swift
//  BoxInventoryApp
//
//  Huvudvy som visar alla lådor
//

import SwiftUI

struct ContentView: View {
    @StateObject private var dataStore = DataStore()
    @State private var showingAddBox = false
    @State private var newBoxNumber = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(dataStore.boxes) { box in
                    NavigationLink(destination: BoxDetailView(box: box, dataStore: dataStore)) {
                        HStack {
                            Text("Låda \(box.number)")
                                .font(.headline)
                            if !box.name.isEmpty {
                                Text("- \(box.name)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Text("\(box.items.count) items")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: dataStore.deleteBox)
            }
            .navigationTitle("Vind Lådor")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddBox = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddBox) {
                AddBoxView(dataStore: dataStore, isPresented: $showingAddBox)
            }
        }
    }
}

struct AddBoxView: View {
    @ObservedObject var dataStore: DataStore
    @Binding var isPresented: Bool
    @State private var boxNumber = ""
    @State private var boxName = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Lådinformation")) {
                    TextField("Lådnummer", text: $boxNumber)
                        .keyboardType(.numberPad)
                    TextField("Namn (valfritt)", text: $boxName)
                }
            }
            .navigationTitle("Ny Låda")
            .navigationBarItems(
                leading: Button("Avbryt") { isPresented = false },
                trailing: Button("Spara") {
                    if let number = Int(boxNumber) {
                        dataStore.addBox(number: number, name: boxName)
                        isPresented = false
                    }
                }
                .disabled(boxNumber.isEmpty)
            )
        }
    }
}
