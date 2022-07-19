//
//  LaunchJSON.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 18.07.2022.
//

import UIKit

struct Launch: Codable {
    let nameLaunch: String
    let date: Int
    let success: Bool?
    let rocket: String
    
    enum CodingKeys: String, CodingKey {
        case nameLaunch = "name"
        case date = "date_unix"
        case success
        case rocket
    }
}
