//
//  ViewController.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 29.06.2022.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    static let mainControllerID = "mainControllerID"
    var settingsValues = SettingsValue(heightSetting: 0, diametrSetting: 0, massSetting: 0, payLoadSetting: 0)
    
    let scrollView = UIScrollView()
    let mainImageView = UIImageView()
    var pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        configure()
        addConstraint()
        addInformation()
        notifications()
    }
}

extension ViewController {
    func configure() {
        self.view.backgroundColor = .tintColor
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.size.height)
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width*4, height: 1168)
        scrollView.isPagingEnabled = true

        pageControl.backgroundColor = UIColor(rgb: 0x121212)
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControl.Event.valueChanged)
        
        mainImageView.backgroundColor = .gray

        self.view.addSubview(mainImageView)
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
    }
}

extension ViewController {
    func addInformation() {
        for index in 0...3 {
            let informationView: UIView = {
                let view = UIView(frame: CGRect(x: self.scrollView.frame.size.width * CGFloat(index), y: 248, width: self.scrollView.frame.size.width, height: 920))
                view.backgroundColor = UIColor(rgb: 0x000000)
                view.layer.cornerRadius = 32
                return view
            }()
            let rocketNameTextLabel: UILabel = {
                let label = UILabel(frame: CGRect(x: 32, y: 48, width: 146, height: 32))
                label.textColor = UIColor(rgb: 0xF6F6F6)
                label.font = UIFont(name: "HelveticaNeue-Medium", size: 23)
                label.textAlignment = .center
                label.text = "Falcon Heavy"
                return label
            }()
            let settingsButtonImage: UIImageView = {
                let imageView = UIImageView(frame: CGRect(x: 311, y: 48, width: 32, height: 32))
                imageView.image = UIImage(named: "settingIcon")
                return imageView
            }()
            let settingButton: UIButton = {
                let button = UIButton(frame: settingsButtonImage.frame)
                button.addTarget(self, action: #selector(self.setting), for: .touchUpInside)
                return button
            }()
            let informationCollectionView: UICollectionView = {
                let layout = UICollectionViewFlowLayout()
                let collectionView = UICollectionView(frame: CGRect(x: 32, y: 112, width: informationView.frame.size.width - 32, height: 96), collectionViewLayout: layout)
                layout.scrollDirection = .horizontal
                collectionView.register(UINib(nibName: "InfCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ViewController.mainControllerID)
                collectionView.delegate = self
                collectionView.dataSource = self
                collectionView.backgroundColor = .clear
                return collectionView
            }()
            let infView: InfView = {
                let view = InfView(frame: CGRect(x: 32, y: 248, width: 311, height: 104))
                view.firstLaunchValueLabel.text = "7 февраля 2018"
                view.countryValueLabel.text = "США"
                view.priceLaunchValueLabel.text = "$90млн"
                return view
            }()
            let firsStageView: StageView = {
                let view = StageView(frame: CGRect(x: 32, y: 432, width: 311, height: 104))
                view.quantityEnginesValueLabel.text = "27"
                view.quantityFuelValueLabel.text = "308.6"
                view.combustionTimeValueLabel.text = "593"
                return view
            }()
            let secondStageView: StageView = {
                let view = StageView(frame: CGRect(x: 32, y: 616, width: 311, height: 104))
                view.quantityEnginesValueLabel.text = "1"
                view.quantityFuelValueLabel.text = "243.2"
                view.combustionTimeValueLabel.text = "397"
                return view
            }()
            let firstStageLabel: UILabel = {
                let label = UILabel(frame: CGRect(x: 32, y: 392, width: 311, height: 24))
                label.textColor = UIColor(rgb: 0xF6F6F6)
                label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
                label.textAlignment = .left
                label.text = "ПЕРВАЯ СТУПЕНЬ"
                return label
            }()
            let secondStageLabel: UILabel = {
                let label = UILabel(frame: CGRect(x: 32, y: 576, width: 311, height: 24))
                label.textColor = UIColor(rgb: 0xF6F6F6)
                label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
                label.textAlignment = .left
                label.text = "ВТОРАЯ СТУПЕНЬ"
                return label
            }()
            let launchButton: UIButton = {
                let button = UIButton(frame: CGRect(x: 32, y: 760, width: 311, height: 56))
                button.backgroundColor = UIColor(rgb: 0x212121)
                button.layer.cornerRadius = 12
                button.setTitle("Посмотреть загрузки", for: .normal)
                button.titleLabel?.textColor = UIColor(rgb: 0xF6F6F6)
                button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
                button.titleLabel?.textAlignment = .center
                button.addTarget(self, action: #selector(self.Launch), for: .touchUpInside)
                return button
            }()
            
            informationView.addSubview(rocketNameTextLabel)
            informationView.addSubview(settingsButtonImage)
            informationView.addSubview(settingButton)
            informationView.addSubview(informationCollectionView)
            informationView.addSubview(infView)
            informationView.addSubview(firstStageLabel)
            informationView.addSubview(secondStageLabel)
            informationView.addSubview(firsStageView)
            informationView.addSubview(secondStageView)
            informationView.addSubview(launchButton)

            self.scrollView.addSubview(informationView)
        }
    }
}

extension ViewController: UICollectionViewDelegate {

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.mainControllerID, for: indexPath) as? InfCollectionViewCell else {return UICollectionViewCell()}
        cell.configure(value: 23, nameValue: "Width")
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 96, height: 96)
    }
}

extension ViewController {
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func setting() {
        self.present(SettingsViewController.init(), animated: true, completion: nil)
    }
    
    @objc func Launch() {
        self.navigationController?.pushViewController(LaunchViewController.init(), animated: true)
    }
}

extension ViewController {
    func addConstraint() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageControl.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0, constant: 72),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainImageView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 627),
            mainImageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 570),
            mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -98),
            mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -140)
            ])
    }
    
    func notifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(valueSetting(_:)), name: applyValueSettings, object: nil)
    }
    
    @objc func valueSetting(_ notification: Notification) {
        guard let setting = notification.object as? SettingsValue else { return }
        settingsValues = setting
        print(settingsValues)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
