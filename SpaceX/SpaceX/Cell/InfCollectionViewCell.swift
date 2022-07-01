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
        // Initialization code
    }
    
    func configure(value: Int, nameValue: String) {
        valueLabel.text = String(value)
        nameValueLabel.text = nameValue
    }
    
    func setupCell() {
        view.layer.cornerRadius = 32
        view.backgroundColor = .darkGray
        valueLabel.textColor = .white
        nameValueLabel.textColor = .white
    }

}
