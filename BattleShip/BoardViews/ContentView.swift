//
//  ContentView.swift
//  BattleShip
//
//  Created by Owen F on 3/31/25.
//

import SwiftUI

struct ContentView: View {
    @Binding var ID: String
    var body: some View {
        VStack{
            Text("\(ID)")
            BoardBuilder()
        }
        .background(
            ZStack(alignment: .top) {
            Color.black.edgesIgnoringSafeArea(.all)

            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.black]), startPoint: .top, endPoint: .bottom)
                .frame(height: 200)
                .edgesIgnoringSafeArea(.all)
            }
        )
//        .onAppear(){
//            vm.buildAxisArrays()
//        }
    }
}

#Preview{
    ContentView(ID: .constant(""))
        .environmentObject(BoardBuilderViewModel())
}
