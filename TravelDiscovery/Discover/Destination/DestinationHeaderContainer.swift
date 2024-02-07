//
//  DestinationHeaderContainer.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/2/4.
//

import SwiftUI
import Kingfisher

struct DestinationHeaderContainer: UIViewControllerRepresentable {
    
    let imageUrlStrings: [String]
    
    func makeUIViewController(context: Context) -> UIViewController {
//        let redVC = UIHostingController(rootView: Text("First View Controller 123"))
//        redVC.view.backgroundColor = .yellow
//        return redVC
        let pvc = CustomPageViewController(imageUrlStrings: imageUrlStrings)
        return pvc
    }
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        allControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
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

    init(imageUrlStrings: [String]) {
        
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.systemBlue

        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
//        view.backgroundColor = .orange
        
        allControllers = imageUrlStrings.map({
            imageName in
            let hostingController = UIHostingController(rootView: KFImage(URL(string: imageName))
//                                                            Text(imageName)
//                                                        Image(imageName)
                .resizable()
                .scaledToFill()
            )
            hostingController.view.clipsToBounds = true
            return hostingController
        })
                
        setViewControllers([allControllers.first!], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
        self.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
    
    static let imageUrlStrings = [
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6982cc9d-3104-4a54-98d7-45ee5d117531",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e"
    ]
    
    static var previews: some View {
        DestinationHeaderContainer(imageUrlStrings: imageUrlStrings)
                .frame(height: 250)
            NavigationView {
                PopularDestinationDetailsView(destination: .init(name: "Taipei", country: "Taiwan", imageName: "Taipei101", latitude: 25.04841, longitude: 121.53301))
//        //            PopularDestinationDetailsView(destination: .init(name: "Tokyo", country: "Japan", imageName: "Tokyo", latitude: 35.68951, longitude: 139.69170))
            }
    }
}

//#Preview {
//    DestinationHeaderContainer()
//    NavigationView {
//        PopularDestinationDetailsView(destination: .init(name: "Taipei", country: "Taiwan", imageName: "Taipei101", latitude: 25.04841, longitude: 121.53301))
//            PopularDestinationDetailsView(destination: .init(name: "Tokyo", country: "Japan", imageName: "Tokyo", latitude: 35.68951, longitude: 139.69170))
//    }
//}
