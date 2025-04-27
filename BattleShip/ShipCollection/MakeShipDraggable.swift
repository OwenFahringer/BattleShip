//
//  MakeShipDraggable.swift
//  BattleShip
//
//  Created by Owen F on 4/3/25.
//

import SwiftUI

struct DraggableShipView: View {
    @Binding var ship: Ship
    @State var isRotated: Bool = false
    let cellSize: CGFloat
    let gridSize: Int
    let shipwidth: CGFloat
    let shipheight: CGFloat
    @State var cellx: CGFloat = 0
    @State var celly: CGFloat = 0
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(Color.white)
            .frame(width: CGFloat(ship.size) * cellSize-2, height: cellSize-2) //Change ship height and width in the ship placement view
            .position(ship.position)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        
                        
//                        var mylocation: CGPoint = CGPoint(x: value.location.x + cellSize*2, y: value.location.y + cellSize*2)
//                        ship.position = mylocation
                        ship.position = value.location
                    }
                    .onEnded { value in
//                        snapToGrid()
                    }
            )
    }
    
    private func newSnapToGrid(){
        
    }
//    private func snapToGrid() {
//        
//        
//        let gridOffset: CGFloat = 17.5
//        let boardSize: CGFloat = CGFloat(gridSize) * cellSize
//        
//        // Ensure position is within the board's bounds
//        let clampedX = max(gridOffset, min(ship.position.x, gridOffset + boardSize - CGFloat(ship.size) * cellSize))
//        let clampedY = max(gridOffset, min(ship.position.y, gridOffset + boardSize - cellSize))
//        
//        // Find the nearest tile position
//        let nearestCol = round((clampedX - gridOffset) / cellSize)
//        let nearestRow = round((clampedY - gridOffset) / cellSize)
//        
//        // Calculate new snapped position based on tile center
//        let snappedX = gridOffset + (nearestCol * cellSize) + (CGFloat(ship.size) * cellSize / 2) - (cellSize / 2) - 20.5
//        let snappedY = gridOffset + (nearestRow * cellSize) + (cellSize / 2) - 2
//        
//        ship.position = CGPoint(x: snappedX, y: snappedY)
//    }

//    
//    private func isWithinBounds(position: CGPoint, size: Int, gridSize: Int, cellSize: CGFloat) -> Bool {
//        let minX = 17.5 + (CGFloat(size) * cellSize / 2) - (cellSize / 2)
//        let maxX = minX + CGFloat(gridSize - size) * cellSize
//        let minY = 17.5 + (cellSize / 2)
//        let maxY = minY + CGFloat(gridSize - 1) * cellSize
//        return position.x >= minX && position.x <= maxX && position.y >= minY && position.y <= maxY
//    }
//    private func touchesOtherShip(position: CGPoint, size: Int, gridSize: Int, cellSize: CGFloat) -> Bool {
//
//    }
}


#Preview{
    ShipPlaceView()
}


//Get the position of the nearest tile then check whether the height or width is greater to determine the rotation find the closest tile by getting the abs(ship.pos - tile.pos) and snap
