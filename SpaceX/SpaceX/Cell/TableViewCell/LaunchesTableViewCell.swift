//
//  LaunchesTableViewCell.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 13.07.2022.
//

import UIKit

class LaunchesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rocketImageView: UIImageView!
    
    static let launchesCellId = "launchesCellId"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(name: String, dateUnix: Int, launchSuccess: Bool) {
        let date = NSDate(timeIntervalSince1970: Double(dateUnix))
        let dataFormater = DateFormatter()
        dataFormater.dateFormat = "d MMMM,yyyy"
        let localDate = dataFormater.string(from: date as Date)
        
        nameLabel.text = name
        dateLabel.text = localDate
        if launchSuccess {
            rocketImageView.image = UIImage(named: "rocketUp")
        } else if !launchSuccess {
            rocketImageView.image = UIImage(named: "rocketDown")
        }
    }
    
    func setupCell() {
        self.backgroundColor = UIColor(rgb: 0x121212)
        self.contentView.backgroundColor = UIColor(rgb: 0x121212)
        titleView.backgroundColor = UIColor(rgb: 0x212121)
        titleView.layer.cornerRadius = 24
        
        nameLabel.textColor = UIColor(rgb: 0xFFFFFF)
        nameLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        
        dateLabel.textColor = UIColor(rgb: 0x8E8E8F)
        dateLabel.font = UIFont(name: "HelveticaNeue", size: 16)
    }
}
