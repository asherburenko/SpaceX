//
//  informationCollectionViewCell.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 30.06.2022.
//

import UIKit

class InformationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UIView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var nameValueLabel: UILabel!
    
    func configure(value: Int, nameValue: String) {
        valueLabel.textColor = .white
        nameValueLabel.textColor = .lightGray
        
        valueLabel.text = String(value)
        nameValueLabel.text = nameValue
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.backgroundColor = .darkGray
        valueLabel.backgroundColor = .white
        nameValueLabel.backgroundColor = .blue
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        collectionView.backgroundColor = .darkGray
        valueLabel.backgroundColor = .white
        nameValueLabel.backgroundColor = .blue
    }

}
