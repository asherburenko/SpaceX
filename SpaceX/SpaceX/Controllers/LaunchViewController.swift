//
//  LaunchViewController.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 05.07.2022.
//

import UIKit
import Alamofire


class LaunchViewController: UIViewController {
    
    let launchTableView = UITableView()
    private var urlConstructor = URLComponents()
    
    var rocketId = ""
    var rocketName = ""
    var launchArray = [Launch]()

    override func viewDidLoad() {
        super.viewDidLoad()
        launchTableView.delegate = self
        launchTableView.dataSource = self
        registerTableView()
        setup()
        addConstraint()
        getDataLaunch()
        
    }
}

extension LaunchViewController {
    func getDataLaunch() {
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.spacexdata.com"
        urlConstructor.path = "/v4/launches"
        
        guard let url = urlConstructor.url else { return }
        
        AF.request(url).responseData { response in
            guard let data = response.value else { return }
            do {
                let launchData = try JSONDecoder().decode([Launch].self, from: data)
                for index in 0..<launchData.count {
                    if launchData[index].rocket == self.rocketId {
                        self.launchArray.append(launchData[index])
                        self.launchTableView.reloadData()
                    }
                }
            } catch {
                print(error)
            }
        }
    }
}

extension LaunchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

extension LaunchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return launchArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LaunchesTableViewCell.launchesCellId, for: indexPath) as? LaunchesTableViewCell else { return UITableViewCell()}
        
        cell.configure(name: launchArray[indexPath.section].nameLaunch, dateUnix: launchArray[indexPath.section].date, launchSuccess: launchArray[indexPath.section].success ?? true)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
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
        
        navigationItem.title = rocketName
        view.addSubview(launchTableView)
    }
}

extension LaunchViewController {
    func registerTableView() {
        launchTableView.register(UINib(nibName: "LaunchesTableViewCell", bundle: nil), forCellReuseIdentifier: LaunchesTableViewCell.launchesCellId)
    }
}
