//
//  BoardBuilder.swift
//  BattleShip
//
//  Created by Owen F on 4/2/25.
//

//
//  ContentView.swift
//  BattleShip
//
//  Created by Owen F on 3/31/25.
//

import SwiftUI

struct BoardBuilder: View {
    @EnvironmentObject var bbvm: BoardBuilderViewModel
    var allShipsPlaced: Bool = false
    var selectedColor = Color.yellow
    let gridSize = 10
    var body: some View {
        VStack{
            ZStack{
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
                                    RoundedRectangle(cornerRadius:3)//Tile rect
                                        .stroke(lineWidth: 1)
                                        .frame(width: bbvm.cellSize, height: bbvm.cellSize)
                                        .foregroundStyle(Color.normBlue)
                                        .shadow(color: .cyan ,radius: 2)
                                }
                            }
                        }
                    }
                }
                .position(x:UIScreen.screenWidth/2 ,y:250)
                
                    Button{
                        bbvm.isRotated = bbvm.isRotated ? false : true
                    }label:{
                        Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                            .frame(width:35, height:35)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 1)
                            )
                    } // rotation icon
                    .shadow(color: .white ,radius: 2)
                    .foregroundStyle(.white)
                    .opacity(0.8)
                    .position(x:UIScreen.screenWidth/2, y: 680)
                    Button{
                        //test
                        makeTestLocations()
                        Task{
                            try await bbvm.publishToFirebase()
                            
                        }
                    }label:{
                        Text("Confirm")
                            .frame(width:80, height:30)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 1)
                            )
                            
                    }
                    .shadow(color: .white ,radius: 2)
                    .foregroundStyle(.white)
                    .opacity(0.8)
                    .position(x:UIScreen.screenWidth/2, y: 740)
            }
            Spacer()
                .frame(height:150)
            ShipPlace()
        }
        .onAppear(){
            bbvm.buildAxisArrays()
        }
    }
    func makeTestLocations() {
        for i in 0..<10 {
            bbvm.selfBoardStatus[i][0] = true
        }
    }
}

#Preview {
    ContentView(ID: .constant(""))
        .environmentObject(BoardBuilderViewModel())
}
