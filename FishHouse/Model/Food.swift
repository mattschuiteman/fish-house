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
    let abbrev: String
    var box_weight: Int
    var add_on: Bool
    var show_amount: Int
    var point_amount: Int
}
