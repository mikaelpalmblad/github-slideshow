//
//  DataStore.swift
//  BoxInventoryApp
//
//  Hanterar sparande och laddning av data
//

import Foundation
import Combine

class DataStore: ObservableObject {
    @Published var boxes: [Box] = []

    private let boxesKey = "SavedBoxes"

    init() {
        loadBoxes()
    }

    // Lägg till en ny låda
    func addBox(number: Int, name: String = "") {
        let newBox = Box(number: number, name: name)
        boxes.append(newBox)
        boxes.sort { $0.number < $1.number }
        saveBoxes()
    }

    // Ta bort en låda
    func deleteBox(at offsets: IndexSet) {
        boxes.remove(atOffsets: offsets)
        saveBoxes()
    }

    // Uppdatera en låda
    func updateBox(_ box: Box) {
        if let index = boxes.firstIndex(where: { $0.id == box.id }) {
            boxes[index] = box
            saveBoxes()
        }
    }

    // Lägg till item i en låda
    func addItem(to box: Box, item: BoxItem) {
        if let index = boxes.firstIndex(where: { $0.id == box.id }) {
            boxes[index].items.append(item)
            saveBoxes()
        }
    }

    // Ta bort item från låda
    func deleteItem(from box: Box, at offsets: IndexSet) {
        if let index = boxes.firstIndex(where: { $0.id == box.id }) {
            boxes[index].items.remove(atOffsets: offsets)
            saveBoxes()
        }
    }

    // Spara lådor till UserDefaults
    private func saveBoxes() {
        if let encoded = try? JSONEncoder().encode(boxes) {
            UserDefaults.standard.set(encoded, forKey: boxesKey)
        }
    }

    // Ladda lådor från UserDefaults
    private func loadBoxes() {
        if let data = UserDefaults.standard.data(forKey: boxesKey),
           let decoded = try? JSONDecoder().decode([Box].self, from: data) {
            boxes = decoded
        }
    }
}
