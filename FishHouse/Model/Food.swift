//
//  Fish.swift
//  FishHouse
//
//  Created by Matthew Schuiteman on 5/19/22.
//

import Foundation

struct Food: Identifiable
{
    //Unique name to identify the food
    let id: String
    //Let this be identical to name for developer's sake, may not be the savviest way of doing this
    let name: String
    // Abbreviation for user convienence, instead of saying "Pacfic Herring" say "PAC"
    let abbrev: String
    // Weight of the box that the fish comes in, needed for breakout calculation
    var box_weight: Int
    // Are we adding on an extra box of fish?
    var add_on: Bool
    // -- Requests --
    // Amount that show requests
    var show: Int
    //Amount that dolphin point requests
    var point: Int
    //Etc...
    var pinn: Int
    
    var otter: Int
    
    var whale: Int
    
    var aquariums: Int
    
    var rescue: Int
    
    var wild: Int
}
