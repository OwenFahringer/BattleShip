//
//  BoardBuildVM.swift
//  BattleShip
//
//  Created by Owen F on 5/9/25.
//

import SwiftUI
import Foundation
import Firebase

@MainActor
class BoardBuilderViewModel: ObservableObject{
    @Published var cellSize: CGFloat = 35
    @Published var ID = UUID().uuidString
    
    @Published var xSnapLocations: [CGFloat] = []
    @Published var ySnapLocations: [CGFloat] = []
    @Published var isRotated: Bool = false
    @Published var correctTiles: [[CGFloat]] = [[]]
    @Published var formattedTiles: [Bool] = []
    
    @Published var selfBoardStatus: [[Bool]] = Array(
        repeating: Array(repeating: false, count: 10),
        count: 10
    )
    
    func buildAxisArrays (){ // creates the arrays containing the values to the top left of every square contained inside the board
        xSnapLocations.removeAll()
        ySnapLocations.removeAll()
        let xStartTilePos = UIScreen.screenWidth/2 + 9 - (cellSize * 6)
        let yStartTilePos = -271.5 + (cellSize*5)
        print(xStartTilePos)
        print(yStartTilePos)
        for i in 0 ..< 10{
            xSnapLocations.append(xStartTilePos + (CGFloat(i) * cellSize))
            ySnapLocations.append(yStartTilePos + (CGFloat(i) * cellSize))
        }
    }
    
    func publishToFirebase() async throws {
        let db = Firestore.firestore()
//        let moveSet = correctTiles
        formatArrayFb()
        let data = formattedTiles
        
        let game = Game(id: "ABC", turn: true, name1: "Owen", name2: "Evan", player1Pos: data, player2Pos: data)
        do {
            try await db.collection("games").document("\(game.id)").setData(game.toDictionaryVals())
            print("Successfully wrote board positions")
        } catch {
            print("error writing to firebase \(error)")
        }
    }
    
    
    @MainActor
    func formatArrayFb (){
        print(selfBoardStatus)
        formattedTiles = selfBoardStatus.flatMap { $0 }
//        for i in 0..<correctTiles.count{
//            for j in 0..<correctTiles[0].count{
//                formattedTiles.append(correctTiles[i][j])
//            }
//        }
        print(formattedTiles)
    }
    
    
    //    func toDictionaryValues() -> [String: Any] {
    //        return [
    //            playerData
    //        ]
    //    }
}

#Preview {
    ContentView(ID: .constant(""))
        .environmentObject(BoardBuilderViewModel())
}

