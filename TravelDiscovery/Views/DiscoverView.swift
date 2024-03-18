//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Travis on 2023/2/19.
//

import SwiftUI

extension Color { 
    static let discoverBackground = Color(.init(white: 0.95, alpha: 1))
}

struct DiscoverView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [ .foregroundColor: UIColor.white
        ]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .top, endPoint: .center).ignoresSafeArea()
                
                Color.discoverBackground
                    .offset(y: 400)
                
                ScrollView {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go ?")
                        Spacer()
                    }
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.3)))
                    .cornerRadius(10)
                    .padding(16)
                    
                    DiscoverCategoriesView()
                    
                    VStack{
                        PopularDestinationsView()
                        PopularRestaurantsView()
                        TrendingCreatorsView()
                    }
                    .background(Color.discoverBackground)
                    .cornerRadius(16)
                    .padding(.top, 32)

                }.navigationTitle("Discover")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
