//
//  ContentView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 11/10/21.
//

import SwiftUI

struct MotherView: View {
    
    @ObservedObject var requests = FishHouseRequests()
    
    @ObservedObject var weights = FishHouseWeights()
    
    @ObservedObject var add_ons = FishHouseAddOns()
    
    var body: some View {
     
        FishHouseBoardView(requests: requests, weights: weights, add_ons: add_ons)
    
    }
}

