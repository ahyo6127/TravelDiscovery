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
        UINavigationBar.appearance().largeTitleTextAttributes = [ .foregroundColor: UIColor.systemBackground
        ]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.mint, Color.cyan]), startPoint: .top, endPoint: .center).ignoresSafeArea()
                
                Color.discoverBackground
                    .offset(y: 400)
                
                ScrollView {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go ?")
                        Spacer()
                    }
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(.systemBackground))
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
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .padding(.top, 32)

                }.navigationTitle("Discover")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([ColorScheme.dark, .light], id: \.self) { scheme in
            DiscoverView().colorScheme(scheme)
        }
        
//        VStack {
//            DiscoverView().colorScheme(.dark)
//            DiscoverView().colorScheme(.light)
//        }
    }
}
