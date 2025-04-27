//
//  ContentView.swift
//  BattleShip
//
//  Created by Owen F on 3/31/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: ViewModel = ViewModel()
    var body: some View {
        VStack{
            BoardBuilder()
        }
//        .onAppear(){
//            vm.buildAxisArrays()
//        }
    }
}

#Preview{
    ContentView()
}
