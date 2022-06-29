//
//  ViewController.swift
//  SpaceX
//
//  Created by Александр Шербуренко on 29.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let mainImageView = UIImageView()
    let informationView = UIView()
    var pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        configure()
        addConstraint()
    }


}

extension ViewController {
    func configure() {
        self.view.backgroundColor = .blue
        
        scrollView.contentSize = CGSize(width: 375, height: 1168)
        
        mainImageView.backgroundColor = .gray
        
        informationView.backgroundColor = UIColor(rgb: 0x000000)
        informationView.layer.cornerRadius = 32
        
        pageControl.backgroundColor = UIColor(rgb: 0x121212)
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
        self.scrollView.addSubview(mainImageView)
        self.scrollView.addSubview(informationView)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}

extension ViewController {
    func addConstraint() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        informationView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let scrollViewLeadingConstr = NSLayoutConstraint(item: scrollView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let scrollViewTrailingConstr = NSLayoutConstraint(item: scrollView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        let scrollViewTopConstr = NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let scrollViewBottomConstr = NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        
        let pageControlHeightConstr = NSLayoutConstraint(item: pageControl, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0, constant: 72)
        let pageControlLeadingConstr = NSLayoutConstraint(item: pageControl, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let pageControlTrailingConstr = NSLayoutConstraint(item: pageControl, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        let pageControlBottomConstr = NSLayoutConstraint(item: pageControl, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        
        let informationViewHeightConstr = NSLayoutConstraint(item: informationView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0, constant: 920)
        let informationViewLeadingConstr = NSLayoutConstraint(item: informationView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let informationViewTrailingConstr = NSLayoutConstraint(item: informationView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        let informationViewTopConstr = NSLayoutConstraint(item: informationView, attribute: .top, relatedBy: .equal, toItem: mainImageView, attribute: .top, multiplier: 1, constant: 388)
        
        let mainImageViewHeightConstr = NSLayoutConstraint(item: mainImageView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0, constant: 627)
        let mainImageViewWidthConstr = NSLayoutConstraint(item: mainImageView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0, constant: 570)
        let mainImageViewLeadingConstr = NSLayoutConstraint(item: mainImageView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: -98)
        let mainImageViewTrailingConstr = NSLayoutConstraint(item: mainImageView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -140)
        
        self.view.addConstraints([scrollViewTopConstr, scrollViewBottomConstr,  scrollViewLeadingConstr, scrollViewTrailingConstr])
        self.view.addConstraints([pageControlHeightConstr, pageControlLeadingConstr, pageControlTrailingConstr, pageControlBottomConstr])
        self.view.addConstraints([informationViewHeightConstr, informationViewLeadingConstr, informationViewTrailingConstr, informationViewTopConstr, informationViewTopConstr])
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
