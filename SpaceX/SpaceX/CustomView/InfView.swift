//
//  InfView.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 05.07.2022.
//

import UIKit

class InfView: UIView {

     private let firstLaunchLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 123, height: 24))
        label.textColor = UIColor(rgb: 0xCACACA)
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textAlignment = .left
        label.text = "Первый Запуск"
        return label
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 40, width: 123, height: 24))
        label.textColor = UIColor(rgb: 0xCACACA)
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textAlignment = .left
        label.text = "Страна"
        return label
    }()
    
    private let priceLaunchLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 80, width: 160, height: 24))
        label.textColor = UIColor(rgb: 0xCACACA)
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textAlignment = .left
        label.text = "Cтоимость запуска"
        return label
    }()
    
    let firstLaunchValueLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 201, y: 0, width: 120, height: 24))
        label.textColor = UIColor(rgb: 0xF6F6F6)
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textAlignment = .right
        return label
    }()
    
    let countryValueLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 201, y: 40, width: 120, height: 24))
        label.textColor = UIColor(rgb: 0xF6F6F6)
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textAlignment = .right
        return label
    }()
    
    let priceLaunchValueLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 201, y: 80, width: 120, height: 24))
        label.textColor = UIColor(rgb: 0xF6F6F6)
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textAlignment = .right
        return label
    }()
    
       override init(frame: CGRect) {
           super.init(frame: frame)
           setup()
       }

       required init(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    func setup() {
        self.backgroundColor = .clear
        
        self.addSubview(firstLaunchLabel)
        self.addSubview(countryLabel)
        self.addSubview(priceLaunchLabel)
        self.addSubview(firstLaunchValueLabel)
        self.addSubview(countryValueLabel)
        self.addSubview(priceLaunchValueLabel)
    }
}
