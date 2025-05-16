//
//  MakeShipDraggable.swift
//  BattleShip
//
//  Created by Owen F on 4/3/25.
//

import SwiftUI

struct DraggableShipView: View {
    @EnvironmentObject var vm: BoardBuilderViewModel
    @Binding var ship: Ship
    let cellSize: CGFloat
    let gridSize: Int
    let shipwidth: CGFloat
    let shipheight: CGFloat
    
    @State var xCount: Int = 0
    @State var yCount: Int = 0
    @State var xMinDist: CGFloat = 100
    @State var yMinDist: CGFloat = 100
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(Color.white)
            .frame(width: CGFloat(ship.size) * cellSize-2, height: cellSize-2) //Change ship height and width in the ship placement view
            .position(ship.position)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        ship.position = value.location
                        print(ship.position)
                    }
                    .onEnded { value in
                        print("\(ship.position) Snapped")
                        newSnapToGrid()
                        print(ship.position)
                    }
            )
        if(vm.isRotated){
                    Rectangle()
                        .frame(width:70, height: 35)
                        .position(x: vm.xSnapLocations[0], y: vm.ySnapLocations[0])
                }
    }
    
    private func newSnapToGrid(){
        //snaps to the proper location but looks somewhat odd because the snap occurs to the right always by half of the ships length.
        xMinDist = 500
        yMinDist = 500
        for i in 0 ..< 10{
            //Gets the tile with the minimum y distance from a cell
            if(xMinDist >= abs(ship.position.x - (vm.xSnapLocations[i]))){
                xCount = i
                xMinDist = abs(ship.position.x - (vm.xSnapLocations[i]))
            }
            //Gets the tile with the minimum x distance from a cell
            if(yMinDist >= abs(ship.position.y - (vm.ySnapLocations[i]))){
                yCount = i
                yMinDist = abs(ship.position.y - vm.ySnapLocations[i])
            }
        }
        if(yMinDist > 35 || xMinDist > 35){
            ship.position.x = ship.originalPosition.x
            ship.position.y = ship.originalPosition.y
            return
        }
        if(ship.rotated){//vertical
            if(yCount + ship.size-1 < vm.ySnapLocations.count){
                ship.position.y = vm.ySnapLocations[yCount] + CGFloat(ship.size) * (cellSize/2)
                ship.position.x = vm.xSnapLocations[xCount]
            }else{
                ship.position.x = ship.originalPosition.x
                ship.position.y = ship.originalPosition.y
            }
        }else{//horizontal
            if(xCount + ship.size-1 < vm.xSnapLocations.count){
                ship.position.x = vm.xSnapLocations[xCount] + CGFloat(ship.size) * (cellSize/2)
                ship.position.y = vm.ySnapLocations[yCount]
            }else{
                ship.position.x = ship.originalPosition.x
                ship.position.y = ship.originalPosition.y
            }
        }
    //    if(ship.position != ship.originalPosition){
    //
    //    }
    }
}


#Preview {
    ContentView(ID: .constant(""))
        .environmentObject(BoardBuilderViewModel())
}


//Get the position of the nearest tile then check whether the height or width is greater to determine the rotation find the closest tile by getting the abs(ship.pos - tile.pos) and snap

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
