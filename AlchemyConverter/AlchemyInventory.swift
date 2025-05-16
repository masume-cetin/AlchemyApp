//
//  AlchemyInventory.swift
//  AlchemyConverter
//
//  Created by masume çetin on 13.05.2025.
//
import SwiftUI
import Foundation

class InventoryManager: ObservableObject {
    @Published var inventory: [AlchemyItem: Int] = [:]

    private let key = "alchemyInventory"

    init() {
        load()
    }

    func add(_ item: AlchemyItem, count: Int = 1) {
        inventory[item, default: 0] += count
        save()
    }

    func remove(_ item: AlchemyItem, count: Int = 1) {
        inventory[item, default: 0] = max(0, inventory[item, default: 0] - count)
        save()
    }

    private func save() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(inventory) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    private func load() {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: key),
           let saved = try? decoder.decode([AlchemyItem: Int].self, from: data) {
            self.inventory = saved
        } else {
            // Initialize with default values
            self.inventory = Dictionary(uniqueKeysWithValues:
                AlchemyItem.allCases.map { ($0, $0.defaultQuantity) }
            )
            save()
        }
    }
}

