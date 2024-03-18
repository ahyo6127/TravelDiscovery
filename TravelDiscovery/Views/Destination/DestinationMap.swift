//
//  DestinationMap.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/3/3.
//

import SwiftUI

struct Attraction: Identifiable {
    let id = UUID().uuidString
    let name, imageName: String
    let latitude, longitude: Double
}

struct CustomMapAnnotation: View {
    
    let attraction: Attraction
    
    var body: some View {
        VStack {
            
            Image(attraction.imageName)
                .resizable()
                .frame(width: 80, height: 60)
                .cornerRadius(3.0)
            
            Text(attraction.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.vertical, 4)
                .padding(.horizontal, 6)
                .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
                .cornerRadius(3.0)
                .overlay(
                     RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
            
        }.shadow(radius: 5)
    }
}
