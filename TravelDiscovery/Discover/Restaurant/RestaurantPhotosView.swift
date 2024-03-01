//
//  RestaurantPhotosView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/3/1.
//

import SwiftUI

struct RestaurantPhotosView: View {
    var body: some View {
        ScrollView {
            //GRID
            
            LazyVGrid(columns: [
                GridItem(.fixed(120), spacing: 4),
                GridItem(.fixed(120), spacing: 4),
                GridItem(.fixed(120))
                
            ], spacing: 4, content: {
                
                ForEach(0..<15, id: \.self) { num in
                    Text("Placeholder")
                        .padding()
                        .background(Color.red)
                }
              
            })
        }.navigationBarTitle("All Photos", displayMode: .inline)
    }
}

#Preview {
    NavigationView {
        RestaurantPhotosView()
            
    }.previewLayout(.fixed(width: 600, height: 400))
}
