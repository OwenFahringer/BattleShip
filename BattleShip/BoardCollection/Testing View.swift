//
//  Testing View.swift
//  BattleShip
//
//  Created by Owen F on 4/7/25.
//


//Testing for location getter
import SwiftUI

struct TestingView: View {
    @State var ships: Ship = Ship(id: 1, size:4, position: CGPoint(x: 80, y: 420), originalPosition: CGPoint(x: 80, y: 420))
    @State var xpos: CGFloat = 0
    @State var ypos: CGFloat = 0
    var body: some View {
        VStack{
            Rectangle()
                .position(x: xpos, y: ypos)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            xpos = round(value.location.x)
                            ypos = round(value.location.y)
                        }
                        .onEnded({ value in
                            print(xpos, ypos)
                        })
                )
                .frame(width: 100, height: 100)
//                .overlay(
//                    GeometryReader { geo in
//                        let position = geo.frame(in: .global).origin
//                    }
//                )
Button("Get Location") {
    print("\(xpos), \(ypos)")
            }
        }
    }
}
#Preview {
    TestingView()
}
