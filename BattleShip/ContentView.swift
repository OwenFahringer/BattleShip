//
//  ContentView.swift
//  BattleShip
//
//  Created by Owen F on 3/31/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            BoardBuilder()
            Rectangle()
                .frame(width: 0, height: 0)
        }
    }
}

#Preview{
    ContentView()
}
