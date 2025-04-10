//
//  Ship.swift
//  BattleShip
//
//  Created by Owen F on 4/3/25.
//

import SwiftUI

struct Ship: Identifiable {
    let id: Int
    let size: Int
    var position: CGPoint
    let originalPosition: CGPoint
}
