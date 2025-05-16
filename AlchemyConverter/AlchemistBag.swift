import SwiftUI

struct AlchemistBag: View {
    @Binding var isPresented: Bool
    @Binding var selectedItem: AlchemyItem?

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(.alchemistBagInside)
                .resizable()
                .ignoresSafeArea()
                

            Button(action: {
                isPresented = false
            }) {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .padding(.top,10)
                    .padding(.trailing,10)
            }
            .padding(.top, 20)
            .padding(.trailing, 20)

            VStack {
                Text("Alchemist Bag")
                    .padding(.top,50)
                    .font(.title)
                    .bold(true)
                    .fontDesign(.monospaced)
                    .foregroundColor(Color.red.opacity(0.5))
                    .shadow(color:Color.black, radius: 1)

                ScrollView(.vertical, showsIndicators: true) {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 100)), count: 3)) {
                        ForEach(AlchemyItem.allCases, id: \.self) { alchItem in
                            let isAvailable = alchItem.defaultQuantity > 0
                            let isSelected = alchItem == selectedItem
                            
                            let itemView = AlchemyItemView(
                                item: .constant(alchItem),
                                backgroundColor: Color.pink.opacity(0.2),
                                borderColor: isSelected ? nil : Color.black,
                                isQuantity: true
                            )
                                .opacity(isAvailable ? 1 : 0.3)
                            
                            if isAvailable {
                                itemView
                                    .onTapGesture {
                                        selectedItem = alchItem
                                        isPresented = false
                                    }
                            } else {
                                itemView
                            }
                        }
                    }
                    .ignoresSafeArea()
                }
            }
            .padding(.vertical, 20)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AlchemistBag(isPresented: .constant(true), selectedItem: .constant(nil))
}
