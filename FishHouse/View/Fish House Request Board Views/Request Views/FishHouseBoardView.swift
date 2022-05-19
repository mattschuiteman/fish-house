//
//  FishHouseBoardView.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 11/10/21.
//

import SwiftUI

struct FishHouseBoardView: View {
    
    
    @ObservedObject var requests: FishHouseRequests
    
    @ObservedObject var weights: FishHouseWeights
    
    @ObservedObject var add_ons: FishHouseAddOns
    
    var body: some View {
        
        GeometryReader {geometry in
            
            NavigationView {
            
                HStack {
                    
                
                    HStack (spacing: 0) {
                        
                        SideTitleViews(geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                        
                        HerringStack(requests: requests, geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                        
                        CapelinStack(requests: requests, geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                        
                        MackerelStack(requests: requests, geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                        
                        SardinesStack(requests: requests, geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                        
                        SquidStack(requests: requests, geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                        
                        ShrimpStack(requests: requests, geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                        
                        SalmonStack(requests: requests, geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)
                        
                    }
                    .foregroundColor(Color.black)
                    .padding(.bottom, 35)
                    .padding(.leading)
                    
                    VStack (spacing: 10) {
                    
                        NavigationLink(destination: BreakoutBoardDataView(requests: requests, weights: weights, add_ons: add_ons, geometryHeight: geometry.size.height, geometryWidth: geometry.size.width)) {
                            
                            HStack {
                                
                                Text("Breakout")
                                
                                Image(systemName: "chevron.right")
                                
                            }
                            
                        }
                        
                        NavigationLink(destination: AddOnMotherView(add_ons: add_ons, requests: requests, weights: weights)) {
                            
                            HStack {
                                
                                Text("Add On")
                                
                                Image(systemName: "plus.slash.minus")
                            }
                        }
                        
                    }
                    .font(.system(size: 17))
                    .foregroundColor(Color.blue)
                    .padding()
                }
                
            }
            .buttonStyle(.plain)
            .phoneOnlyStackNavigationView()
        }
    }
    
    let cornerRadius: CGFloat = 20.0
}

struct FishHouseBoardView_Previews: PreviewProvider {
    static var previews: some View {
        FishHouseBoardView(requests: FishHouseRequests.init(), weights: FishHouseWeights.init(), add_ons: FishHouseAddOns.init())
.previewInterfaceOrientation(.landscapeRight)
    }
}
