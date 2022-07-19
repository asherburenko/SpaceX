//
//  ViewController.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 29.06.2022.
//

import UIKit
import Alamofire
import Kingfisher
import Accelerate

class ViewController: UIViewController, UIScrollViewDelegate {
    
    static let mainControllerID = "mainControllerID"
    var settingsValues = SettingsValue(heightSetting: 0, diametrSetting: 0, massSetting: 0, payLoadSetting: 0)
    var collectionViewData = CollectionViewData(height: 0.0, diametr: 0.0, mass: 0.0, payLoadpayloadWeights: 0.0, heightDescription: "", diametrDescription: "", massDescription: "", payLoadpayloadWeightsDescription: "")
    var collViewData = [CollectionViewData]()
    var informationArray = [SpaceRockets]()
    var dateForm = ""
    
    private var urlConstructor = URLComponents()
    var pageControl = UIPageControl()
    let scrollView = UIScrollView()
    let mainImageView = UIImageView()
    let collectionView1: UICollectionView = {
        Metod().createCollectionView()
    }()
    let collectionView2: UICollectionView = {
        Metod().createCollectionView()
    }()
    let collectionView3: UICollectionView = {
        Metod().createCollectionView()
    }()
    let collectionView4: UICollectionView = {
        Metod().createCollectionView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView1.delegate = self
        collectionView1.dataSource = self
        collectionView2.delegate = self
        collectionView2.dataSource = self
        collectionView3.delegate = self
        collectionView3.dataSource = self
        collectionView4.delegate = self
        collectionView4.dataSource = self
        getDstaSpaceRockets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollView.delegate = self
        configure()
        addConstraint()
        notifications()
    }
}

extension ViewController {
    func configure() {
        self.view.backgroundColor = UIColor(rgb: 0x000000)
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.size.height)
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width*4, height: view.frame.size.height+356)
        scrollView.isPagingEnabled = true

        pageControl.backgroundColor = UIColor(rgb: 0x121212)
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControl.Event.valueChanged)

        self.view.addSubview(mainImageView)
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
    }
}

extension ViewController {
    func getDate(dateIn: String) {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "d MMMM,yyyy"

        if let date = dateFormatterGet.date(from: dateIn) {
             dateForm = dateFormatterPrint.string(from: date)
        } else {
           print("There was an error decoding the string")
        }
    }
    
    func getDstaSpaceRockets() {
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.spacexdata.com"
        urlConstructor.path = "/v4/rockets"
        guard let url = urlConstructor.url else { return }
        
        AF.request(url).responseData { response in
            guard let data = response.value else { return }
            
            do {
                let spaceRoketsData = try JSONDecoder().decode([SpaceRockets].self, from: data)
                self.informationArray.insert(contentsOf: spaceRoketsData, at: 0)
                self.addInformation()
            } catch {
                print(error)
            }
        }
    }
    
    func addInformation() {
        for index in 0...(informationArray.count - 1) {
            getDate(dateIn: informationArray[index].firstFlight)
            updateImage()
            collectionViewData = CollectionViewData(height: informationArray[index].height.meters, diametr: informationArray[index].diameter.meters, mass: informationArray[index].mass.kg, payLoadpayloadWeights: informationArray[index].payloadWeightsLeoKg?.first ?? 0.0, heightDescription: "Высота, m", diametrDescription: "Диаметр, m", massDescription: "Масса, kg", payLoadpayloadWeightsDescription: "Нагр. kg")
            collViewData.insert(collectionViewData, at: index)
            
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
                label.text = informationArray[index].name
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
            let infView: InfView = {
                let view = InfView(frame: CGRect(x: 32, y: 248, width: 311, height: 104))
                view.firstLaunchValueLabel.text = dateForm
                view.countryValueLabel.text = informationArray[index].country
                view.priceLaunchValueLabel.text = "$\(informationArray[index].costPerLaunch / 1000000) млн "
                return view
            }()
            let firsStageView: StageView = {
                let view = StageView(frame: CGRect(x: 32, y: 432, width: 311, height: 104))
                view.quantityEnginesValueLabel.text = String(informationArray[index].firstStage.engines)
                view.quantityFuelValueLabel.text = String(informationArray[index].firstStage.fuelAmountTons)
                view.combustionTimeValueLabel.text = String(informationArray[index].firstStage.burnTimeSEC ?? 0)
                return view
            }()
            let secondStageView: StageView = {
                let view = StageView(frame: CGRect(x: 32, y: 616, width: 311, height: 104))
                view.quantityEnginesValueLabel.text = String(informationArray[index].secondStage.engines)
                view.quantityFuelValueLabel.text = String(informationArray[index].secondStage.fuelAmountTons)
                view.combustionTimeValueLabel.text = String(informationArray[index].secondStage.burnTimeSEC ?? 0)
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
            
            switch index {
            case 0:
                collectionView1.frame = CGRect(x: 32, y: 112, width: view.frame.size.width - 32, height: 96)
                informationView.addSubview(collectionView1)
            case 1:
                collectionView2.frame = CGRect(x: 32, y: 112, width: view.frame.size.width - 32, height: 96)
                informationView.addSubview(collectionView2)
            case 2:
                collectionView3.frame = CGRect(x: 32, y: 112, width: view.frame.size.width - 32, height: 96)
                informationView.addSubview(collectionView3)
            case 3:
                collectionView4.frame = CGRect(x: 32, y: 112, width: view.frame.size.width - 32, height: 96)
                informationView.addSubview(collectionView4)
            default:
                break
            }
            
            informationView.addSubview(rocketNameTextLabel)
            informationView.addSubview(settingsButtonImage)
            informationView.addSubview(settingButton)
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
        
        if collectionView == collectionView1 {
            Metod().addCell(indexPath: indexPath, index: 0, array: collViewData, cell: cell)
        } else if collectionView == collectionView2 {
            Metod().addCell(indexPath: indexPath, index: 1, array: collViewData, cell: cell)
        } else if collectionView == collectionView3 {
            Metod().addCell(indexPath: indexPath, index: 2, array: collViewData, cell: cell)
        } else {
            Metod().addCell(indexPath: indexPath, index: 3, array: collViewData, cell: cell)
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 96, height: 96)
    }
}

extension ViewController {
    func updateImage() {
        let image = informationArray[pageControl.currentPage].flickrImages.randomElement()
        let url = URL(string: image!)
        mainImageView.kf.setImage(with: url)
    }
    
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
        updateImage()
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        updateImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func setting() {
        self.present(SettingsViewController.init(), animated: true, completion: nil)
    }
    
    @objc func Launch() {
        let backButton: UIBarButtonItem = {
            let button = UIBarButtonItem(
                  title: "Назад",
                  style: UIBarButtonItem.Style.plain,
                  target: nil,
                  action: nil
            )
            button.tintColor = UIColor(rgb: 0xF6F6F6)
            return button
        }()
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton;
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(rgb: 0xF6F6F6)]
        
        let rocketId = informationArray[pageControl.currentPage].id
        let rocketName = informationArray[pageControl.currentPage].name
        let send = LaunchViewController.init()
        send.rocketId = rocketId
        send.rocketName = rocketName
        self.navigationController?.pushViewController(send, animated: true)
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
            mainImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0, constant: 500),
            mainImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }
    
    func notifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(valueSetting(_:)), name: applyValueSettings, object: nil)
    }
    
    @objc func valueSetting(_ notification: Notification) {
        guard let setting = notification.object as? SettingsValue else { return }
        settingsValues = setting
        Metod().getDataCollectionView(index: pageControl.currentPage, collectionViewArray: &collViewData, informationArray: informationArray, values: settingsValues)
        collectionView1.reloadData()
        collectionView2.reloadData()
        collectionView3.reloadData()
        collectionView4.reloadData()
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
