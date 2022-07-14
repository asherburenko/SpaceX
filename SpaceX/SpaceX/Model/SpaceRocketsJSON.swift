//
//  SpaceRocketsJSON.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 14.07.2022.
//

import UIKit

struct SpaceRockets: Codable {
    let name: String
    let firstFlight: String
    let country: String
    let costPerLaunch: Int
    let height: HeightModel
    let diameter: HeightModel
    let mass: MassModel
    let payloadWeights: [PayloadModel]
    let firstStage: FirstStageModel
    let secondStage: FirstStageModel
    let flickrImages: [String]
    var payloadWeightsLeoKg: [Double]? {
        get {
            let payloadWeightsKg = payloadWeights.compactMap{ $0.kg }
            return payloadWeightsKg
        }
    }
    var payloadWeightsLeoLb: [Double]? {
        get {
            let payloadWeightsLb = payloadWeights.compactMap{ $0.lb }
            return payloadWeightsLb
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case firstFlight = "first_flight"
        case country
        case costPerLaunch = "cost_per_launch"
        case height
        case diameter
        case mass
        case payloadWeights = "payload_weights"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case flickrImages = "flickr_images"
    }
}

struct HeightModel: Codable {
    let meters: Double
    let feet: Double
}

struct MassModel: Codable {
    let kg: Double
    let lb: Double
}

struct PayloadModel: Codable {
    let id: String
    let kg: Double
    let lb: Double
}


struct FirstStageModel: Codable {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}
