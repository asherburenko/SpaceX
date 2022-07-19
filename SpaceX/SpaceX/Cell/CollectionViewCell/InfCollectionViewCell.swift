//
//  InfCollectionViewCell.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 01.07.2022.
//

import UIKit

class InfCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var nameValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func configure(value: Double, nameValue: String) {
        valueLabel.text = String(value)
        nameValueLabel.text = nameValue
    }
    
    func setupCell() {
        view.layer.cornerRadius = 32
        view.backgroundColor = UIColor(rgb: 0x212121)
        
        valueLabel.textColor = UIColor(rgb: 0xFFFFFF)
        valueLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        valueLabel.textAlignment = .center
        
        nameValueLabel.textColor = UIColor(rgb: 0x8E8E8F)
        nameValueLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        nameValueLabel.textAlignment = .center
    }

}
