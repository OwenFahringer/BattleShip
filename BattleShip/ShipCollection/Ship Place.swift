//
//  Ship Place.swift
//  BattleShip
//
//  Created by Owen F on 4/3/25.
//

import SwiftUI
struct ShipPlace: View {
    @EnvironmentObject var vm: ViewModel
    @State var isRotated: Bool = false
    let gridSize = 10
    let cellSize: CGFloat = 35
    
    @State private var ships: [Ship] = [
        Ship(id: 0, size: 1, position: CGPoint(x: 50, y: 300), originalPosition: CGPoint(x: 50, y: 300), rotated: false),
        Ship(id: 1, size: 2, position: CGPoint(x: 155, y: 300), originalPosition: CGPoint(x: 155, y: 300), rotated: false),
        Ship(id: 2, size: 3, position: CGPoint(x: 275, y: 300), originalPosition: CGPoint(x: 275, y: 300), rotated: false),
        Ship(id: 3, size: 4, position: CGPoint(x: 80, y: 400), originalPosition: CGPoint(x: 80, y: 400), rotated: false),
        Ship(id: 4, size: 5, position: CGPoint(x: 260, y: 400), originalPosition: CGPoint(x: 260, y: 400), rotated: false),
    ]
    
    var body: some View {
        VStack {
            ZStack {
                ForEach($ships) { $ship in
                    DraggableShipView(ship: $ship, cellSize: cellSize, gridSize: gridSize, shipwidth: isRotated ? cellSize : CGFloat(ship.size) * cellSize, shipheight: isRotated ? CGFloat(ship.size) * cellSize : cellSize)
                        .foregroundStyle(.white)
                }
            }
            .frame(width: 350, height: 350)
            .position(x:UIScreen.screenWidth/2,y:-100)
            
        }
    }
}
struct ShipPlaceView: View{
    var body: some View{
        ShipPlace()
    }
}


#Preview {
    ContentView(ID: .constant(""))
        .environmentObject(BoardBuilderViewModel())
}
