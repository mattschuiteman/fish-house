//
//  FishHouseApp.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 11/10/21.
//

import SwiftUI
import Firebase

@main
struct FishHouseApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MotherView()
        }
    }
}
