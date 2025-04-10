//
//  Ship Place.swift
//  BattleShip
//
//  Created by Owen F on 4/3/25.
//

import SwiftUI
struct ShipPlace: View {
    @State var isRotated: Bool = false
    let gridSize = 10
    let cellSize: CGFloat = 35
    
    @State private var ships: [Ship] = [
        Ship(id: 0, size: 3, position: CGPoint(x: 80, y: 420), originalPosition: CGPoint(x: 80, y: 420)),
        Ship(id: 1, size: 4, position: CGPoint(x: 250, y: 420), originalPosition: CGPoint(x: 250, y: 420))
    ]
    
    var body: some View {
        VStack {
            ZStack {
                BoardBuilder()
                ForEach($ships) { $ship in
                    DraggableShipView(ship: $ship, cellSize: cellSize, gridSize: gridSize, shipwidth: isRotated ? cellSize : CGFloat(ship.size) * cellSize, shipheight: isRotated ? CGFloat(ship.size) * cellSize : cellSize)
                        .foregroundStyle(.white)
                }
            }
            .frame(width: 350, height: 350)
            
        }
    }
}
struct ShipPlaceView: View{
    var body: some View{
        ShipPlace()
    }
}
#Preview{
    ShipPlaceView()
}
