//
//  BoardConfigTest.swift
//  BattleShip
//
//  Created by Owen F on 4/25/25.
//

import SwiftUI

struct BoardConfigTest:View {
    @State var board: [[Bool]] = Array(
        repeating: Array(repeating: false, count: 10),
        count: 10
    )

    var body: some View {
        Button("Change slot"){
            if(!board[0][0]){
                board[0][0] = true
                print("slot changed")
            }
        }
        Button("Print Slot"){
            print(board[0][0])
            print(board[0][1])
        }
    }
}
#Preview {
    BoardConfigTest()
}
