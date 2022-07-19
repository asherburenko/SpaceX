//
//  SpaceRocketsModel.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 14.07.2022.
//

import UIKit

struct SpaceRocketsModel {
    var name: String
    var firstFlight: String
    var country: String
    var costPerLaunch: Int
    var heightM: Double
    var heightFt: Double
    var diameterM: Double
    var diameterFt: Double
    var massKg: Double
    var massLb: Double
    var payloadWeightsKg: Double
    var payloadWeightsLb: Double
    var firstStageEngines: Int
    var firstStageFuelAmountTons: Double
    var firstStageBurnTimeSEC: Int?
    var secondStageEngines: Int
    var secondStageFuelAmountTons: Double
    var secondStageBurnTimeSEC: Int?
    var flickrImages: String
}
