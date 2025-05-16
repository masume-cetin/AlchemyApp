//
//  Pentagram.swift
//  AlchemyConverter
//
//  Created by masume çetin on 12.05.2025.
//

import SwiftUI

struct verticalRectangle:View{
    @State private var rotate = false
      var verticalRectangleHorizontal:CGFloat = 350
      var verticalRectangleVertical:CGFloat = 600
    var body:some View{
        Path { path in
            path.move(to: CGPoint(x: verticalRectangleHorizontal / 2, y: 80))
            path.addLine(to: CGPoint(x: verticalRectangleHorizontal - 10, y: verticalRectangleVertical / 2))
            path.addLine(to: CGPoint(x: verticalRectangleHorizontal/2, y: verticalRectangleVertical - 80))
            path.addLine(to: CGPoint(x:10, y: verticalRectangleVertical / 2))
            path.addLine(to: CGPoint(x: verticalRectangleHorizontal / 2, y:80))
        }.stroke(Color.yellow, lineWidth: 3)
           // .rotationEffect(.degrees(rotate ? 90 : 0))
    }
}
#Preview {
    verticalRectangle()
}
