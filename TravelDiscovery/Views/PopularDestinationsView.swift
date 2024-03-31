//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/1/29.
//

import SwiftUI

struct PopularDestinationsView: View {
    
    let destinations : [Destination] = [
        .init(name: "Paris", country: "France", imageName: "Taipei101", latitude: 25.04841, longitude: 121.53301),
        .init(name: "Tokyo", country: "Japan", imageName: "Tokyo", latitude: 35.68951, longitude: 139.69170),
        .init(name: "New York", country: "United State", imageName: "New_York", latitude: 40.71592,  longitude: -74.0055),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("More")
                    .font(.system(size: 12, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            .background(Color(.systemBackground))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8.0) {
                    
                    ForEach( destinations, id: \.self ) { destination in
                        NavigationLink (
                        destination: NavigationLazyView(PopularDestinationDetailsView(destination: destination)),
                        label: {
                            PopularDestinationTile(destination: destination)
                                .padding(.bottom)
                        })
                    }
                    
                }.padding(.horizontal)
            }
        }
    }
}


struct PopularDestinationTile: View {
    
    let destination: Destination
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .cornerRadius(4)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)

            Text(destination.name)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.black)
                .padding(.horizontal, 12)
            
            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.init(red: 0.4, green: 0.4, blue: 0.4))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
            
        }.asTile()
    }
}


struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        
//        ForEach([ColorScheme.dark, .light], id: \.self) { scheme in
//            NavigationView {
//                PopularDestinationDetailsView(destination: .init(name: "Taipei", country: "Taiwan", imageName: "Taipei101",  latitude: 25.04841, longitude: 121.53301))
//                    .colorScheme(scheme)
//            }
//        }
        
        VStack {
            PopularDestinationsView().colorScheme(.dark)
            PopularDestinationsView().colorScheme(.light)
        }
    }
}
