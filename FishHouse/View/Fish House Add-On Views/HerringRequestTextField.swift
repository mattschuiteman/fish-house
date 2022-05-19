//
//  HerringRequestTextField.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 1/16/22.
//

import SwiftUI

struct HerringRequestTextField: View {
    
    @ObservedObject var requests: FishHouseRequests
    
    var ID: String
    
    var request: Int
    
    @State var requestInput: Int
    
    var body: some View {
        TextField("\(request)#", value: $requestInput, format: .number)
            .keyboardType(.numberPad)
            .onChange(of: requestInput) {newValue in
                requests.updateData(requestToUpdateID: ID, updatedAmount: newValue)
            }
    }
}

