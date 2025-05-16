//
//  Game.swift
//  BattleShip
//
//  Created by Owen F on 5/14/25.
//

class Game: Identifiable{
    var id: String
    var turn: Bool
    var name1: String
    var name2: String
    var player1Pos: [Bool]
    var player2Pos: [Bool]
    
    
    init(id: String, turn: Bool, name1: String, name2: String, player1Pos: [Bool], player2Pos: [Bool]) {
        self.id = id
        self.turn = turn
        self.name1 = name1
        self.name2 = name2
        self.player1Pos = player1Pos
        self.player2Pos = player2Pos
    }
    init(data: [String: Any]){
        id = data["id"] as? String ?? "No Id found"
        turn = data["turn"] as? Bool ?? true
        name1 = data["name1"] as? String ?? "No Name1 found"
        name2 = data["name2"] as? String ?? "No Name2 found"
        player1Pos = data["player1Pos"] as? [Bool] ?? []
        player2Pos = data["player2Pos"] as? [Bool] ?? []
        
    }
    func toDictionaryVals () -> [String: Any] {
        return [
            "id": id,
            "turn": turn,
            "name1": name1,
            "name2": name2,
            "player1Pos": player1Pos,
            "player2Pos": player2Pos
        ]
    }
}
