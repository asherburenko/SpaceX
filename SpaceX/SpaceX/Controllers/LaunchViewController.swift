//
//  LaunchViewController.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 05.07.2022.
//

import UIKit

class LaunchViewController: UIViewController {
    
    let launchTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        launchTableView.delegate = self
        launchTableView.dataSource = self
        registerTableView()
        setup()
        addConstraint()
    }
}

extension LaunchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView: UIView = {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: launchTableView.frame.size.width, height: 16))
            view.backgroundColor = .white
            return view
        }()
        return footerView
    }
}

extension LaunchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LaunchesTableViewCell.launchesCellId, for: indexPath) as? LaunchesTableViewCell else { return UITableViewCell()}
        
        cell.configure(name: "Heavy holidays", date: "6 января, 2022")
        return cell
    }
}

extension LaunchViewController {
    func addConstraint() {
        launchTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            launchTableView.topAnchor.constraint(equalTo:view.topAnchor, constant: 128),
            launchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            launchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            launchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension LaunchViewController {
    func setup() {
        view.backgroundColor = UIColor(rgb: 0x121212)
        launchTableView.backgroundColor = .clear
        
        navigationItem.title = "Name"
        view.addSubview(launchTableView)
    }
}

extension LaunchViewController {
    func registerTableView() {
        launchTableView.register(UINib(nibName: "LaunchesTableViewCell", bundle: nil), forCellReuseIdentifier: LaunchesTableViewCell.launchesCellId)
    }
}
