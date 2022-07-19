//
//  Metod.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 15.07.2022.
//

import UIKit

class Metod {
    
    func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.register(UINib(nibName: "InfCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ViewController.mainControllerID)
        collectionView.backgroundColor = .clear
        return collectionView
    }
    
    func addCell(indexPath: IndexPath, index: Int, array: [CollectionViewData],  cell: InfCollectionViewCell) {
        switch indexPath.row {
        case 0:
            cell.configure(value: array[index].height, nameValue: array[index].heightDescription)
        case 1:
            cell.configure(value: array[index].diametr, nameValue: array[index].diametrDescription)
        case 2:
            cell.configure(value: array[index].mass, nameValue: array[index].massDescription)
        case 3:
            cell.configure(value: array[index].payLoadpayloadWeights, nameValue: array[index].payLoadpayloadWeightsDescription)
        default:
            break
        }
    }
    
    func getDataCollectionView(index: Int, collectionViewArray: inout[CollectionViewData], informationArray: [SpaceRockets], values: SettingsValue) {
        if values.heightSetting == 0 {
            collectionViewArray[index].height = informationArray[index].height.meters
            collectionViewArray[index].heightDescription = "Высота, m"
        } else {
            collectionViewArray[index].height = informationArray[index].height.feet
            collectionViewArray[index].heightDescription = "Высота, ft"
        }
        if values.diametrSetting == 0 {
            collectionViewArray[index].diametr = informationArray[index].diameter.meters
            collectionViewArray[index].diametrDescription = "Диаметр, m"
        } else {
            collectionViewArray[index].diametr = informationArray[index].diameter.feet
            collectionViewArray[index].diametrDescription = "Диаметр, ft"
        }
        if values.massSetting == 0 {
            collectionViewArray[index].mass = informationArray[index].mass.kg
            collectionViewArray[index].massDescription = "Масса, kg"
        } else {
            collectionViewArray[index].mass = informationArray[index].mass.lb
            collectionViewArray[index].massDescription = "Масса, lb"
        }
        if values.payLoadSetting == 0 {
            collectionViewArray[index].payLoadpayloadWeights = informationArray[index].payloadWeightsLeoKg?.first ?? 0.0
            collectionViewArray[index].payLoadpayloadWeightsDescription = "Нагрузка, kg"
        } else {
            collectionViewArray[index].payLoadpayloadWeights = informationArray[index].payloadWeightsLeoLb?.first ?? 0.0
            collectionViewArray[index].payLoadpayloadWeightsDescription = "Нагрузка, lb"
        }
    }
}
