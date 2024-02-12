//
//  RestaurantDetailsView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/2/12.
//

import SwiftUI

struct RestaurantDetailsView: View {
    
    let restaurant: Restaurant
    
    var body: some View {
        ScrollView {
            
            ZStack(alignment: .bottomLeading) {
                Image(restaurant.imageName)
                    .resizable()
                    .scaledToFill()
                
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                        
                        HStack {
                            ForEach(0..<5, id: \.self) { num in
                                Image(systemName: "star.fill")
                            }.foregroundColor(.orange)
                        }
                    }
                    Spacer()
                    
                    Text("See more photos")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(width: 80)
                        .multilineTextAlignment(.trailing)
                }.padding()
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text ("Location & Description")
                    .font(.system(size: 16, weight: .bold))

                Text("Tokyo, Japan")
                    .font(.system(size: 16))
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "dollarsign.circle.fill")
                    }.foregroundColor(.orange)
                }
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
                    .padding(.top, 8)
                    .font(.system(size: 14, weight: .regular))

            }.padding()
            
            HStack {
                Text ("Popular Dishes")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }.padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(0..<5, id: \.self) { num in
                        VStack(alignment: .leading, spacing: 8)  {
                            Image("Bubble_MilkTea")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 80)
                                .cornerRadius(5)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                                .shadow(radius: 2)
                                .padding(.vertical, 2)
                            
                            Text("Taipei's Night Market")
                                .font(.system(size: 14, weight: .bold))
                            Text("87 photos")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                        }
                    }
                }.padding(.horizontal)
            }
           
            
        }.navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}

#Preview {
    NavigationView {
        RestaurantDetailsView(restaurant: .init(name: "Taipei's Night Market", imageName: "Bubble_MilkTea"))
    }
}
