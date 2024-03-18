//
//  ActivityIndicatorView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/2/1.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    typealias UIViewType = UIActivityIndicatorView
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}
