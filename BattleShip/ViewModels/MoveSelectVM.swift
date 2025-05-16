//
//  MoveSelectVM.swift
//  BattleShip
//
//  Created by Owen F on 5/9/25.
//

import SwiftUI
import Foundation
import Firebase


class MoveSelectVM: ObservableObject {
    @Published var opponentCorrectTiles: [[Int]] = [[]]
    @Published var gameID: String = "AJNVH"
    
    func pullFromFirebase() async throws{
        let db = Firestore.firestore()
        
        do{
            let querySnapshot = try await db.collection("games").getDocuments()
            for document in querySnapshot.documents{
                let boardPositions = document.data()
            }
            
        }
    }
}




//
//let db = Firestore.firestore()
//
//do {
//  let querySnapshot = try await db.collection("Activity").getDocuments()
//  for document in querySnapshot.documents {
//    print("\(document.documentID) => \(document.data())")
//      
//      let foundActivity = ActivityModel(data: document.data())
//      activities.append(foundActivity)
//      print("Added activity: \(foundActivity.activityName)")
//  }
//} catch {
//  print("Error getting documents: \(error)")
//}
