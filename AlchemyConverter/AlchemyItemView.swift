//
//  AlchemyItemView.swift
//  AlchemyConverter
//
//  Created by masume çetin on 14.05.2025.
//

import SwiftUI

struct AlchemyItemView: View {
    @Binding var item : AlchemyItem?
    var backgroundColor : Color?
    var borderColor : Color?
    var isQuantity : Bool = false
    var body: some View {
        ZStack(alignment: .bottom){
            if item != nil {
                let name = item?.name ?? ""
                let quantity = (isQuantity ? ((" X") + String(item!.defaultQuantity) ?? "") : "")
                Image(item!.image)
                    .resizable()
                    .scaledToFit()
                Text(name+quantity)
                    .fontDesign(.monospaced)
                    .shadow(color:.black, radius: 2)
                    .padding(3)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                  //  .background(.brown.opacity(0.1))
                    .foregroundStyle(Color.white)
            }
        }.padding(3)
            .frame(width: 100,height: 100)
            .background(backgroundColor.opacity(0.7))
            .border(borderColor ?? Color.yellow,width: 4)
      
    }
}

#Preview {
    AlchemyItemView(item: .constant(nil))
}
