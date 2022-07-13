//
//  settingsTableViewCell.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 07.07.2022.
//

import UIKit

class settingsTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellSecmentedControl: UISegmentedControl!
    
    static let settingsCellID = "settingsCellID"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup() {
        cellView.backgroundColor = UIColor(rgb: 0x121212)
        cellLabel.backgroundColor = .clear
        cellLabel.textColor = UIColor(rgb: 0xF6F6F6)
        cellSecmentedControl.backgroundColor = UIColor(rgb: 0x212121)
        
        let titleTextAttributesNormal = [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x8E8E8F)]
        let titleTextAttributesSelected = [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x121212)]
        cellSecmentedControl.setTitleTextAttributes(titleTextAttributesNormal, for: .normal)
        cellSecmentedControl.setTitleTextAttributes(titleTextAttributesSelected, for: .selected)
    }
}
