//
//  SettingsViewController.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 30.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let titleView = SettingView()
    let heightView: SegmentControlView = {
        let view = SegmentControlView(frame: CGRect(x: 28, y: 112, width: 319, height: 40))
        view.valueLabel.text = "Высота"
        view.valueSecmentedControl.setTitle("m", forSegmentAt: 0)
        view.valueSecmentedControl.setTitle("ft", forSegmentAt: 1)
        return view
    }()
    let diametrView: SegmentControlView = {
        let view = SegmentControlView(frame: CGRect(x: 28, y: 176, width: 319, height: 40))
        view.valueLabel.text = "Диаметр"
        view.valueSecmentedControl.setTitle("m", forSegmentAt: 0)
        view.valueSecmentedControl.setTitle("ft", forSegmentAt: 1)
        return view
    }()
    let massView: SegmentControlView = {
        let view = SegmentControlView(frame: CGRect(x: 28, y: 240, width: 319, height: 40))
        view.valueLabel.text = "Масса"
        view.valueSecmentedControl.setTitle("kg", forSegmentAt: 0)
        view.valueSecmentedControl.setTitle("lb", forSegmentAt: 1)
        return view
    }()
    let payloadView: SegmentControlView = {
        let view = SegmentControlView(frame: CGRect(x: 28, y: 304, width: 319, height: 40))
        view.valueLabel.text = "Полезная нагрузка"
        view.valueSecmentedControl.setTitle("kg", forSegmentAt: 0)
        view.valueSecmentedControl.setTitle("lb", forSegmentAt: 1)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addConstraint()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        returnOnController()
    }
    
    func addConstraint() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.topAnchor),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setup() {
        view.backgroundColor = UIColor(rgb: 0x121212)
        
        titleView.headerButton.addTarget(self, action: #selector(returnOnController), for: .touchUpInside)
        
        view.addSubview(titleView)
        view.addSubview(heightView)
        view.addSubview(diametrView)
        view.addSubview(massView)
        view.addSubview(payloadView)
    }
    
    @objc func returnOnController() {
        let setting = SettingsValue(heightSetting: heightView.valueSecmentedControl.selectedSegmentIndex, diametrSetting: diametrView.valueSecmentedControl.selectedSegmentIndex, massSetting: massView.valueSecmentedControl.selectedSegmentIndex, payLoadSetting: payloadView.valueSecmentedControl.selectedSegmentIndex)
        NotificationCenter.default.post(name: applyValueSettings, object: setting)
        
        self.dismiss(animated: true)
    }
}
