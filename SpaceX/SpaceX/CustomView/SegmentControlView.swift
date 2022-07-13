//
//  SegmentControlView.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 12.07.2022.
//

import UIKit

class SegmentControlView: UIView {

    let valueLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 319, height: 40))
        label.textColor = UIColor(rgb: 0xF6F6F6)
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textAlignment = .left
        return label
    }()
    let valueSecmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["1","2"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.frame = CGRect(x: 204, y: 0, width: 115, height: 40)
        segmentedControl.backgroundColor = UIColor(rgb: 0x212121)
        let titleTextAttributesNormal = [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x8E8E8F)]
        let titleTextAttributesSelected = [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x121212)]
        segmentedControl.setTitleTextAttributes(titleTextAttributesNormal, for: .normal)
        segmentedControl.setTitleTextAttributes(titleTextAttributesSelected, for: .selected)
        return segmentedControl
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
        
        self.addSubview(valueLabel)
        self.addSubview(valueSecmentedControl)
    }

}
