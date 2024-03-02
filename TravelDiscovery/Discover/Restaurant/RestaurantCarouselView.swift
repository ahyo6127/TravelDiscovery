//
//  RestaurantCarouselView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/3/2.
//

import SwiftUI
import Kingfisher

struct RestaurantCarouselContainer: UIViewControllerRepresentable {
    
    let imageUrlStrings: [String]
    let selectedIndex: Int
    
    func makeUIViewController(context: Context) -> UIViewController {
//        let redVC = UIHostingController(rootView: Text("First View Controller 123"))
//        redVC.view.backgroundColor = .yellow
//        return redVC
        let pvc = CarouselPageViewController(imageUrlStrings: imageUrlStrings, selectedIndex: selectedIndex)
        return pvc
    }
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

class CarouselPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        allControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        self.selectedIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        
        if index == 0 { return nil }
        return allControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        
        if index == allControllers.count - 1 { return nil }
        return allControllers[index + 1]
    }
    
    
//    let firstVC = UIHostingController(rootView: Text("First View Controller"))
//    let secondVC = UIHostingController(rootView: Text("Second View Controller"))
//    let thirdVC = UIHostingController(rootView: Text("Third View Controller"))
//
//    lazy var allControllers: [UIViewController] = [
//        firstVC, secondVC, thirdVC
//    ]
    
    var allControllers: [UIViewController] = []
    var selectedIndex: Int

    init(imageUrlStrings: [String], selectedIndex: Int) {
        self.selectedIndex = selectedIndex
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.systemBlue

        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        //page that we swipe through
        allControllers = imageUrlStrings.map({
            imageName in
            let hostingController = UIHostingController(rootView:
                ZStack {
                    Color.black
                    KFImage(URL(string: imageName))
                    .resizable()
                    .scaledToFit()
                }
            )
            hostingController.view.clipsToBounds = true
            return hostingController
        })
        
        if selectedIndex < allControllers.count {
            setViewControllers([allControllers[selectedIndex]], direction: .forward, animated: true, completion: nil)
        }
        
//        if allControllers.first != nil{
//            setViewControllers([allControllers.first!], direction: .forward, animated: true, completion: nil)
//        }
        
        self.dataSource = self
        self.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
