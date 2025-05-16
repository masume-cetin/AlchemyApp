//
//  HearthBar.swift
//  AlchemyConverter
//
//  Created by masume çetin on 14.05.2025.
//
import SwiftUI
struct HeartBar: View {
    var percentage: Double // value from 0.0 to 1.0
    var maxHearts: Int = 3

    var body: some View {
        HStack(spacing : 2) {
            ForEach(0..<maxHearts, id: \.self) { index in
                let heartLevel = percentage * Double(maxHearts)
                if Double(index) + 1 <= heartLevel {
                    Image(.hearthFull)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .shadow(color:Color.yellow.opacity(0.5),radius: 5)
                } else if Double(index) < heartLevel {
                    Image(.hearthHalf)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .shadow(color:Color.yellow.opacity(0.5),radius: 5)
                } else {
                    Image(.hearthEmpty)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .shadow(color:Color.yellow.opacity(0.5),radius: 5)
                }
            }
        }
    }
}
