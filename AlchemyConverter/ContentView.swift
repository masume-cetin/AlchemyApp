//
//  ContentView.swift
//  AlchemyConverter
//
//  Created by Masume Çetin on 26.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlchemistBag = false

    @State private var leftItem: AlchemyItem? = nil
    @State private var rightItem: AlchemyItem? = nil
    @State private var topItem: AlchemyItem? = nil
    @State private var bottomItem: AlchemyItem? = nil
    @StateObject var inventory = InventoryManager()
    @State private var currentSelection: Binding<AlchemyItem?>?
    @State private var selectedSlot: AlchemySlot? = nil
    
    var selectedBinding: Binding<AlchemyItem?> {
        switch selectedSlot {
        case .top: return $topItem
        case .bottom: return $bottomItem
        case .left: return $leftItem
        case .right: return $rightItem
        case .none: return .constant(nil)
        }
    }
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.alchemyBackground)
                    .resizable()
                    .ignoresSafeArea()
                HeartBar(percentage: 1)
                    .position(CGPoint(x: geometry.size.width - 70, y: 50))
                verticalRectangle(
                    verticalRectangleHorizontal: geometry.size.width,
                    verticalRectangleVertical: geometry.size.height
                )

                horizontalRectangle(
                    verticalRectangleHorizontal: geometry.size.width,
                    verticalRectangleVertical: geometry.size.height
                )

                Button {} label: {
                    ZStack (alignment:.bottom){
                        Image(.fireButton)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80,height: 80)
                            .padding(.vertical)
                        Text("mix")
                            .fontWeight(.bold)
                            .font(.title2)
                            .foregroundStyle(Color.yellow)
                    }
                }
                .frame(width: 80, height: 80)

                AlchemyItemView(item: $topItem,backgroundColor: .brown)
                    .position(CGPoint(x: geometry.size.width / 2, y: 120))
                    .onTapGesture {
                        selectedSlot = .top
                        DispatchQueue.main.async {
                            showAlchemistBag = true
                        }
                    }

                AlchemyItemView(item: $bottomItem,backgroundColor: .brown)
                    .position(CGPoint(x: geometry.size.width / 2, y: geometry.size.height - 100))
                    .onTapGesture {
                        selectedSlot = .bottom
                        DispatchQueue.main.async {
                            showAlchemistBag = true
                        }
                    }

                AlchemyItemView(item: $rightItem,backgroundColor: .brown)
                    .position(CGPoint(x: geometry.size.width - 50, y: geometry.size.height / 2))
                    .onTapGesture {
                        selectedSlot = .right
                        DispatchQueue.main.async {
                            showAlchemistBag = true
                        }
                    }

                AlchemyItemView(item: $leftItem,backgroundColor: .brown)
                    .position(CGPoint(x: 50, y: geometry.size.height / 2))
                    .onTapGesture {
                        selectedSlot = .left
                        DispatchQueue.main.async {
                            showAlchemistBag = true
                        }
                    }

                Image(.alchemistBagOfSources)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .position(CGPoint(x: 60, y: geometry.size.height - 80))
                    .shadow(color : Color.yellow, radius: 10)
                    .onTapGesture {
                        showAlchemistBag.toggle()
                    }
                Image(.alchemistBook)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .position(CGPoint(x:geometry.size.width - 60, y: geometry.size.height - 80))
                    .shadow(color : Color.yellow, radius: 10)
                    .onTapGesture {
                      //  showAlchemistBag.toggle()
                    }
            }
        }
        .fullScreenCover(isPresented: $showAlchemistBag) {
                AlchemistBag(isPresented: $showAlchemistBag, selectedItem: selectedBinding)
        }.ignoresSafeArea()
            .id(selectedSlot)
    }
}

#Preview {
    ContentView()
}

