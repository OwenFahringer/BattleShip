//
//  GameRoom.swift
//  BattleShip
//
//  Created by Owen F on 5/14/25.
//




import SwiftUI

public struct GameRoom: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var bbvm: BoardBuilderViewModel
    @State var goBoardBuilder: Bool = false

    public var body: some View {
        NavigationStack{
            VStack{ //Open Game Room
                
                Text("Game Code: \(bbvm.ID.prefix(5))")
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                Spacer()
                    .frame(height:20)
                Button{
                    //publish game code to firebase
                } label: {
                    Text("Open Game Room")
                        .frame(width: 100, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .shadow(color: colorScheme == .dark ? .black : .white, radius: 3)
                        )
                }
                .foregroundStyle(colorScheme == .dark ? .white : .black)
                
                Spacer()
                    .frame(height:100)
                ZStack{
                    TextField("Enter Game Code", text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(10)
                        .frame(width:200, height:40)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)                    .frame(width:200, height:40)
                }
                Spacer()
                    .frame(height:10)
                Button{
                    //listen from firebase
                } label: {
                    
                    Text("Join Game")
                        .frame(width: 100, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .shadow(color: colorScheme == .dark ? .black : .white, radius: 3)
                        )
                }
            }
//            .navigationDestination(isPresented: $goBoardBuilder, destination: BoardBuilder())
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .foregroundStyle(colorScheme == .dark ? .white : .black)
            }
        }
    }

#Preview{
    GameRoom()        .environmentObject(BoardBuilderViewModel())
}
