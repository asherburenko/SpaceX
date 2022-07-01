//
//  ViewController.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 29.06.2022.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let mainControllerID = "mainControllerID"
    
    let scrollView = UIScrollView()
    let mainImageView = UIImageView()
    var pageControl = UIPageControl()

    var colors:[UIColor] = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow]

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        configure()
        addConstraint()
        addInformation()
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
            let informationView = UIView(frame: CGRect(x: self.scrollView.frame.size.width * CGFloat(index), y: 248, width: self.scrollView.frame.size.width, height: 920))
            let rocketNameTextField = UITextField(frame: CGRect(x: 32, y: 48, width: 146, height: 32))
            let settingsButtonImage = UIImageView(frame: CGRect(x: 311, y: 48, width: 32, height: 32))
            let settingButton = UIButton(frame: settingsButtonImage.frame)
            let informationCollectionView: UICollectionView = {
                let layout = UICollectionViewFlowLayout()
                let collectionView = UICollectionView(frame: CGRect(x: 32, y: 112, width: informationView.frame.size.width - 32, height: 96), collectionViewLayout: layout)
                layout.scrollDirection = .horizontal
                collectionView.register(UINib(nibName: "InfCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: mainControllerID)
                collectionView.delegate = self
                collectionView.dataSource = self
                collectionView.backgroundColor = .black
                return collectionView
            }()

            informationView.backgroundColor = colors[index]
            informationView.layer.cornerRadius = 32
            
            rocketNameTextField.backgroundColor = .black
            
            settingsButtonImage.image = UIImage(named: "settingIcon")
            settingButton.addTarget(self, action: #selector(self.setting), for: .touchUpInside)
            
            informationView.addSubview(rocketNameTextField)
            informationView.addSubview(settingsButtonImage)
            informationView.addSubview(settingButton)
            informationView.addSubview(informationCollectionView)

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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainControllerID, for: indexPath) as? InfCollectionViewCell else {return UICollectionViewCell()}
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
        self.navigationController?.pushViewController(SettingsViewController.init(), animated: true)
    }
}

extension ViewController {
    func addConstraint() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.translatesAutoresizingMaskIntoConstraints = false

        let pageControlHeightConstr = NSLayoutConstraint(item: pageControl, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0, constant: 72)
        let pageControlLeadingConstr = NSLayoutConstraint(item: pageControl, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let pageControlTrailingConstr = NSLayoutConstraint(item: pageControl, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        let pageControlBottomConstr = NSLayoutConstraint(item: pageControl, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)

        let mainImageViewHeightConstr = NSLayoutConstraint(item: mainImageView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0, constant: 627)
        let mainImageViewWidthConstr = NSLayoutConstraint(item: mainImageView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0, constant: 570)
        let mainImageViewLeadingConstr = NSLayoutConstraint(item: mainImageView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: -98)
        let mainImageViewTrailingConstr = NSLayoutConstraint(item: mainImageView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -140)

        self.view.addConstraints([pageControlHeightConstr, pageControlLeadingConstr, pageControlTrailingConstr, pageControlBottomConstr])
        self.view.addConstraints([mainImageViewWidthConstr, mainImageViewHeightConstr, mainImageViewLeadingConstr, mainImageViewTrailingConstr])
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
