//
//  Player.swift
//  BattleShip
//
//  Created by Owen F on 4/25/25.
//

import SwiftUI

struct Player: Identifiable {
    var id: Int
    var name: String
    var shipPlacements: [[Bool]]
}
