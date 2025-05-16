//
//  Colors.swift
//  BattleShip
//
//  Created by Owen F on 5/9/25.
//

import SwiftUI

extension Color {
    static let darkBlue1 = Color(red: 7/255, green: 36/255, blue: 100/255)
    static let normBlue = Color(red: 10/255, green: 20/255, blue: 200/255)
    static let darkGreen = Color(red: 45/255, green: 194/255, blue: 73/255)
}
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

#Preview {
    PickerBoard()
        .environmentObject(ViewModel())
}
