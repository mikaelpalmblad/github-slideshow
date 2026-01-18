//
//  Models.swift
//  BoxInventoryApp
//
//  Data models för lådor och innehåll
//

import Foundation

// Model för ett item i en låda
struct BoxItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var quantity: Int
    var description: String
}

// Model för en låda
struct Box: Identifiable, Codable {
    var id = UUID()
    var number: Int
    var name: String
    var items: [BoxItem]

    init(number: Int, name: String = "", items: [BoxItem] = []) {
        self.number = number
        self.name = name
        self.items = items
    }
}
