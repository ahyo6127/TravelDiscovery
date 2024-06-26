//
//  PopularRestaurantsView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/1/29.
//

import SwiftUI

struct PopularRestaurantsView: View {
    
    let restaurants: [Restaurant] = [
        .init(name: "Night Market", imageName: "Bubble_MilkTea"),
        .init(name: "Taipei Finest Tapas", imageName: "Fried_Rice"),
    ]
    
    var body: some View{
        VStack {
            HStack {
                Text("Popular Place to Eat")
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
                    
                    ForEach( restaurants, id: \.self ) { restaurant in
                        NavigationLink(
                            destination: RestaurantDetailsView(restaurant: restaurant),
                            label: { 
                                RestaurantTile(restaurant: restaurant)
                                    .foregroundColor(Color(.label))
                        })
                    }
                    
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}


struct RestaurantTile: View {
    
    let restaurant: Restaurant
    
    var body: some View {
        
        HStack(spacing: 8) {
            
            Image(restaurant.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(5)
                .padding(.leading, 6)
                .padding(.vertical, 6)
            
            VStack(alignment: .leading, spacing: 6) {
                HStack{
                    Text(restaurant.name)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.init(red: 0.4, green: 0.4, blue: 0.4))
                    })
                }
                HStack {
                    Image(systemName: "star.fill")
                    Text("4.7．Bubble Tea．$$")
                        .scaledToFill()
                }
                Text("Taipei, Taiwan")
                
            }
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(.black)
            
            Spacer()
            
        }
        .frame(width: 240)
        .asTile()
    }
}


struct PopularRestaurants_Preview : PreviewProvider {
    static var previews: some View {
        PopularRestaurantsView()
        DiscoverView()
    }
}
