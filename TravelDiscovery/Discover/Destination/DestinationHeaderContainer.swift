//
//  DestinationHeaderContainer.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/2/4.
//

import SwiftUI

struct DestinationHeaderContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let redVC = UIViewController()
        redVC.view.backgroundColor = .yellow
        return redVC
    }
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

#Preview {
    DestinationHeaderContainer()
}
