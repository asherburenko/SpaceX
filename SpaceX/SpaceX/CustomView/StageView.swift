//
//  StageView.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 05.07.2022.
//

import UIKit

class StageView: UIView {
    
    private let quantityEnginesLabel: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 0, width: 1180, height: 24))
       label.textColor = UIColor(rgb: 0xCACACA)
       label.font = UIFont(name: "HelveticaNeue", size: 16)
       label.textAlignment = .left
       label.text = "Количество двигателей"
       return label
    }()
    private let quantityFuelLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 40, width: 160, height: 24))
        label.textColor = UIColor(rgb: 0xCACACA)
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textAlignment = .left
        label.text = "Количество топлива"
        return label
    }()
    private let combustionTimeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 80, width: 160, height: 24))
        label.textColor = UIColor(rgb: 0xCACACA)
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textAlignment = .left
        label.text = "Время сгорания"
        return label
    }()
    private let tonLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 283, y: 40, width: 28, height: 24))
        label.textColor = UIColor(rgb: 0x8E8E8F)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.textAlignment = .center
        label.text = "ton"
        return label
    }()
    private let secLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 283, y: 80, width: 28, height: 24))
        label.textColor = UIColor(rgb: 0x8E8E8F)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.textAlignment = .center
        label.text = "sec"
        return label
    }()
    
    let quantityEnginesValueLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 195, y: 0, width: 80, height: 24))
        label.textColor = UIColor(rgb: 0xF6F6F6)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.textAlignment = .right
        return label
    }()
    let quantityFuelValueLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 195, y: 40, width: 80, height: 24))
        label.textColor = UIColor(rgb: 0xF6F6F6)
        label.font = UIFont(name: "HelveticaNeueBold", size: 16)
        label.textAlignment = .right
        return label
    }()
    let combustionTimeValueLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 195, y: 80, width: 80, height: 24))
        label.textColor = UIColor(rgb: 0xF6F6F6)
        label.font = UIFont(name: "HelveticaNeueBold", size: 16)
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
    
        self.addSubview(quantityEnginesLabel)
        self.addSubview(quantityFuelLabel)
        self.addSubview(combustionTimeLabel)
        self.addSubview(quantityEnginesValueLabel)
        self.addSubview(quantityFuelValueLabel)
        self.addSubview(combustionTimeValueLabel)
        self.addSubview(tonLabel)
        self.addSubview(secLabel)
    }
}
