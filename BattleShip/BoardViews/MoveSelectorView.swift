//
//  PickerBoard.swift
//  BattleShip
//
//  Created by Owen F on 4/2/25.
//


import SwiftUI

struct PickerBoard: View {
    @EnvironmentObject var msvm: MoveSelectVM
    @EnvironmentObject var vm: ViewModel
    
    @State var selectedTile = [0,0]
    @State var selected = false
    @State var selectedColor = Color.yellow
    @State var guessedTiles: [[Int]] = []
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius:15)//Outer Board
                    .frame(width: 380,height:380)
                    .foregroundStyle(Color.darkBlue1)
                    .shadow(radius: 4)
                
                    RoundedRectangle(cornerRadius:5)//Cyan Border & background for tiles
                        .frame(width:350, height:350)
                        .foregroundStyle(Color.blue)
                        .shadow(color:.black, radius:5)
                    
                    VStack(spacing: 0) {
                        ForEach(0..<10, id: \.self) { row in
                            HStack(spacing: 0) {
                                ForEach(0..<10, id: \.self) { col in
                                    Button{
                                        selectedTile = [row, col]
                                    } label: {
                                        ZStack{
                                            if isAlreadyGuessed(tile: [row,col]) {
                                                Image(systemName: "x.circle")
                                                    .shadow(color: .black, radius: 3)
                                                    .font(.title2)
                                                    .foregroundColor(tileIsCorrect(tile: [row,col]) ? .green : .red)
                                            }
                                            RoundedRectangle(cornerRadius:3)//Tile rect
                                                .stroke(lineWidth: 1)
                                                .frame(width: 35, height: 35)
                                                .foregroundStyle(Color.normBlue)
                                                .shadow(color: (selectedTile[0] == row && selectedTile[1] == col) ? .black : .cyan,radius: 3)
                                                .cornerRadius(3)
                                        }
                                    }
                            }
                        }
                    }
                }
                .padding(1)
            }
            Spacer()
                .frame(height:20)
            Text("Currently selected: \(selectedTile[0]), \(selectedTile[1])")
            Button{
                if !isAlreadyGuessed(tile: selectedTile) { 
                    guessedTiles.append(selectedTile)
                    print(selectedTile)
                }
            } label: {
                Text("Confirm")
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .frame(width: 100, height: 40)
                            .foregroundStyle(.white)
                    )
            }
            Spacer()
                .frame(height:150)
        }
    }
    func isAlreadyGuessed(tile: [Int]) -> Bool {
        return guessedTiles.contains(tile)
    }
    func tileIsCorrect(tile: [Int]) -> Bool {
        //opponentCorrectTiles is an array of an array of ints that stores 2 values each first corresponds to x second to y
        return msvm.opponentCorrectTiles.contains { $0 == tile }
    }
}

#Preview {
    PickerBoard()
        .environmentObject(ViewModel())
}
