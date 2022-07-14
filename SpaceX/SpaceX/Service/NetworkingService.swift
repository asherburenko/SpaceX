//
//  NetworkingService.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 14.07.2022.
//

import UIKit
import Alamofire

class NetworkingService {
    
    private var urlConstructor = URLComponents()
    private let configuration: URLSessionConfiguration!
    private let session: URLSession!
    
    init() {
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.spacexdata.com"
        configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
    
//    func getDstaSpaceRockets() {
//        urlConstructor.path = "/v4/rockets"
//        guard let url = urlConstructor.url else { return }
//        print(url)
//        
//        AF.request(url).responseData { response in
//            guard let data = response.value else { return }
//            
//            do {
//                let spaceRoketsData = try JSONDecoder().decode([SpaceRockets].self, from: data)
//                infArray.insert(contentsOf: spaceRoketsData, at: 0)
//            } catch {
//                print(error)
//            }
//        }
//    }
    
    func writeDataSpaceRockets(data: [SpaceRockets], index: Int) {
        let information = SpaceRocketsModel(name: data[index].name,
                                            firstFlight: data[index].firstFlight,
                                            country: data[index].country,
                                            costPerLaunch: data[index].costPerLaunch,
                                            heightM: data[index].height.meters,
                                            heightFt: data[index].height.feet,
                                            diameterM: data[index].diameter.meters,
                                            diameterFt: data[index].diameter.feet,
                                            massKg: data[index].mass.kg,
                                            massLb: data[index].mass.lb,
                                            payloadWeightsKg: data[index].payloadWeightsLeoKg?.first ?? 0.0,
                                            payloadWeightsLb: data[index].payloadWeightsLeoLb?.first ?? 0.0,
                                            firstStageEngines: data[index].firstStage.engines,
                                            firstStageFuelAmountTons: data[index].firstStage.fuelAmountTons,
                                            firstStageBurnTimeSEC: data[index].firstStage.burnTimeSEC,
                                            secondStageEngines: data[index].secondStage.engines,
                                            secondStageFuelAmountTons: data[index].secondStage.fuelAmountTons,
                                            secondStageBurnTimeSEC: data[index].secondStage.burnTimeSEC,
                                            flickrImages: data[index].flickrImages.randomElement() ?? "")

        ViewController.informationArray.append(information)
    }
}
