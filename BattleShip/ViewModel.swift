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
    @Published var correctTiles: [CGFloat] = []
    
    @Published var selfBoardStatus: [[cellTracking]] = Array(
        repeating: Array(repeating: .empty, count: 10),
        count: 10
    )
    
    func buildAxisArrays (){ // creates the arrays containing the values to the top left of every square contained inside the board
        xSnapLocations.removeAll()
        ySnapLocations.removeAll()
        let xStartTilePos = UIScreen.screenWidth/2 + 26.5 - (cellSize * 5)
        let yStartTilePos = -271.5 + (cellSize*5)
        print(xStartTilePos)
        print(yStartTilePos)
        for i in 0 ..< 10{
            xSnapLocations.append(xStartTilePos + (CGFloat(i) * cellSize))
            ySnapLocations.append(yStartTilePos + (CGFloat(i) * cellSize))
        }
    }
    
}
//enums
enum cellTracking {
    case adjacent
    case occupied
    case empty
    case hit
    case miss
}
//extensions
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
extension Color {
    static let darkBlue1 = Color(red: 7/255, green: 36/255, blue: 100/255)
    static let normBlue = Color(red: 10/255, green: 20/255, blue: 200/255)
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
