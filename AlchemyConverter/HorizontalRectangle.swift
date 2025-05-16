//
//  HorizontalRectangle.swift
//  AlchemyConverter
//
//  Created by masume çetin on 13.05.2025.
//
import SwiftUI

struct horizontalRectangle:View{
    @State private var rotate = false
      var verticalRectangleHorizontal:CGFloat = 350
      var verticalRectangleVertical:CGFloat = 600
    var body:some View{
        Path { path in
            path.move(to: CGPoint(x:80, y:  200))
            path.addLine(to: CGPoint(x: verticalRectangleHorizontal - 80, y: 200))
            path.addLine(to: CGPoint(x: verticalRectangleHorizontal - 80, y: verticalRectangleVertical - 180))
            path.addLine(to: CGPoint(x:80, y: verticalRectangleVertical - 180))
            path.addLine(to: CGPoint(x:80, y: 200))
        }.stroke(Color.yellow, lineWidth: 3)
           // .rotationEffect(.degrees(rotate ? 90 : 0))
    }
}
#Preview {
    horizontalRectangle()
}
