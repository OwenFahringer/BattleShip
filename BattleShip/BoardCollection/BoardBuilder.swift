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
    @State private var ships: [Ship] = [
    Ship(id: 0, size: 3, position: CGPoint(x: 80, y: 420), originalPosition: CGPoint(x: 80, y: 420)),
    Ship(id: 1, size: 4, position: CGPoint(x: 250, y: 420), originalPosition: CGPoint(x: 250, y: 420))
]
    @State var isRotated: Bool = false //vertical : horizontal
    var selectedTile = [0,0]
    var selected = false
    var selectedColor = Color.yellow
    let gridSize = 10
    let cellSize: CGFloat = 35
    @State var xSnapLocations: [CGFloat] = []
    @State var ySnapLocations: [CGFloat] = []
    
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
                                    .frame(width: 35, height: 35)
                                    .foregroundStyle(Color.normBlue)
                                    .shadow(color: .cyan ,radius: 2)
                                //                                    .overlay(
                                //                                        GeometryReader { geo in
                                //                                            let position = geo.frame(in: .global).origin
                                //                                        }
                                //                                    )
                                //                                    .onAppear(){
                                //                                        print("HI")
                                //                                        if(row == 0 && ySnapLocations.count < 9){
                                //                                            ySnapLocations += [position.y]
                                //                                        }
                                //                                        if(col == 0 && xSnapLocations.count < 9){
                                //                                            xSnapLocations += [position.x]
                                //                                        }
                                //                                    }
                            }
                        }
                    }
                }
                .padding(1)
                Rectangle()
                    .frame(width:1, height:1000)
                Rectangle()
                    .frame(width:1000, height:1)
            }
            .position(x:201 ,y:300)
        }
            Button{
                print(UIScreen.screenWidth)
            }label:{
                Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
            }
            Spacer()
                .frame(height:150)
        }
    }
}

#Preview {
    BoardBuilder()
}
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
