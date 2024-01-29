//
//  PopularRestaurantsView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/1/29.
//

import SwiftUI

struct PopularRestaurantsView: View {
    
    let restaurants: [Restaurant] = [
        .init(name: "Taipei's Night Market", imageName: "Bubble_MilkTea"),
        .init(name: "Taipei Finest Tapas", imageName: "Fried_Rice"),

    ]
    
    var body: some View{
        VStack {
            HStack {
                Text("Popular Place to Eat")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8.0) {
                    ForEach( restaurants, id: \.self ) { restaurant in
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
                                            .foregroundColor(.gray)
                                    })
                                }
                                HStack {
                                    Image(systemName: "star.fill")
                                    Text("4.7．Bubble Tea．$$")
                                        .scaledToFill()
                                }
                                Text("Taipei, Taiwan")
                                
                            }.font(.system(size: 12, weight: .semibold))
                            Spacer()
                            
                        }.frame(width: 240)
                            .background(Color.white)
                            .cornerRadius(5)
                            .shadow(color: .init(.sRGB, white: 0.9, opacity: 1), radius: 4, x: 0.0, y: 0.2)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}



#Preview {
    PopularRestaurantsView()
}
