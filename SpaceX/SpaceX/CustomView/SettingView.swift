//
//  SettingView.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 12.07.2022.
//

import UIKit

class SettingView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 147, y: 18, width: 100, height: 22))
        label.textColor = UIColor(rgb: 0xFFFFFF)
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textAlignment = .center
        label.text = "Настройки"
        return label
    }()
    let headerButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 284, y: 18, width: 75, height: 22))
        button.backgroundColor = .clear
        button.setTitle("Закрыть", for: .normal)
        button.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    let heightView: SegmentControlView = {
        let view = SegmentControlView(frame: CGRect(x: 28, y: 112, width: 319, height: 40))
        view.valueLabel.text = "Высота"
        view.valueSecmentedControl.setTitle("m", forSegmentAt: 0)
        view.valueSecmentedControl.setTitle("ft", forSegmentAt: 1)
        return view
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
        
        self.addSubview(titleLabel)
        self.addSubview(headerButton)
    }
}
