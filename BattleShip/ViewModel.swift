//
//  ViewModelData.swift
//  BattleShip
//
//  Created by Owen F on 4/22/25.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    @Published var cellSize: CGFloat = 35
    @Published var xSnapLocations: [CGFloat] = []
    @Published var ySnapLocations: [CGFloat] = []
    @Published var isRotated: Bool = false
    @Published var yShipStartPos: [CGFloat] = []
    @Published var correctTiles: [CGFloat] = []
    func buildAxisArrays (){
        let xStartTilePos = UIScreen.screenWidth/2 - (cellSize * 5)
        let yStartTilePos = -(250.0 - 7.5 + (cellSize*5))
        print(xStartTilePos)
        print(yStartTilePos)
        for i in 1 ..< 11{
            xSnapLocations.append(xStartTilePos + (CGFloat(i) * cellSize))
            ySnapLocations.append(yStartTilePos + (CGFloat(i) * cellSize))
        }
    }
}
