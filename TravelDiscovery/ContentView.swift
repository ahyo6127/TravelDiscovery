//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Travis on 2023/2/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            ScrollView {
                
                DiscoverCatagoriesView()
                
                PopularDesnationsView()
                
                PopularRestaurantsView()
                
                TrendingCreatorsView()
                
            }.navigationTitle("Discover")
        }
        //            Image(systemName: "globe")
        //                .imageScale(.large)
        //                .foregroundColor(.accentColor)
        //            Text("Hello, world!!!")
        //                .padding()
        //                .navigationBarTitle("Inline", displayMode: .inline)

    }
}

struct Destination: Hashable {
    let name, country, imageName: String
}

struct PopularDesnationsView: View {
    
    let destinations : [Destination] = [
        .init(name: "Taipei", country: "Taiwan", imageName: "Taipei"),
        .init(name: "Tokyo", country: "Japan", imageName: "Tokyo"),
        .init(name: "New York", country: "United State", imageName: "New_York"),
    ]
    
    var body: some View{
        VStack {
            HStack {
                Text("Popular Destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8.0) {
                    ForEach( destinations, id: \.self ) { destination in
                        VStack(alignment: .leading, spacing: 0) {
                            
                            Image(destination.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
    //                            .clipped()
                                .cornerRadius(4)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 6)
           
                            Text(destination.name)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.horizontal, 12)
                            
                            Text(destination.country)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(.gray)
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                            
                        }
    //                        .frame(width: 125)
                            .background(Color(.init(white: 0.9, alpha: 1)))
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 0.2)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct Restaurant: Hashable {
    let name, imageName: String
}

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
                            .background(Color(.init(white: 0.9, alpha: 1)))
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 0.2)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct User: Hashable {
    let name, imageName: String
}

struct TrendingCreatorsView: View {
    
    let users: [User] = [
        .init(name: "userMan 01", imageName: "userMan01"),
        .init(name: "userMan 02", imageName: "userMan02"),
        .init(name: "userMan 03", imageName: "userMan03"),
    ]
    
    var body: some View{
        VStack(spacing: 0) {
            HStack {
                Text("Popular Creators")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 8.0) {
                    ForEach( users, id: \.self ) { user in
                        VStack {
                            Image(user.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(.infinity)
                            Text(user.name)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 60)
                        .shadow(color: .gray, radius: 4, x: 0.0, y: 0.2)
                        .padding(.bottom)
                        .padding(.top)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Category: Hashable {
    let name, imageName: String
}

struct DiscoverCatagoriesView: View {
    
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "carrot.fill"),
        .init(name: "History", imageName: "house.lodge.fill"),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 8) {
                ForEach(categories, id: \.self) { category in
                    VStack(spacing: 4) {
//                        Spacer()
                        Image(systemName: category.imageName)
                            .foregroundColor(Color.white)
                            .frame(width: 64, height: 64)
                            .background(Color.gray)
                            .cornerRadius(64)
                            .shadow(color: .gray ,radius: 4, x: 0.0, y: 2)
                        Text(category.name)
                            .font(.system(size: 12, weight: .semibold))
                    }.frame(width: 80)
                }
            }.padding(.horizontal)
    //                .background(Color.blue)
        }
    }
}
