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

struct PopularDesnationsView: View {
    var body: some View{
        VStack {
            HStack {
                Text("Popular destinations")
                    .font(.system(size: 12, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
        }.padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8.0) {
                ForEach( 0..<5, id: \.self ) { num in
                    Spacer()
                        .frame(width: 125, height: 150)
                        .background(Color.gray)
                        .cornerRadius(5)
                        .shadow(color: .gray, radius: 4, x: 0.0, y: 0.2)
                        .padding(.bottom)
                }
            }.padding(.horizontal)
        }
        
    }
}

struct PopularRestaurantsView: View {
    var body: some View{
        VStack {
            HStack {
                Text("Popular place to eat")
                    .font(.system(size: 12, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
        }.padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8.0) {
                ForEach( 0..<5, id: \.self ) { num in
                    Spacer()
                        .frame(width: 200, height: 64)
                        .background(Color.gray)
                        .cornerRadius(5)
                        .shadow(color: .gray, radius: 4, x: 0.0, y: 0.2)
                        .padding(.bottom)
                }
            }.padding(.horizontal)
        }
        
    }
}

struct TrendingCreatorsView: View {
    var body: some View{
        VStack {
            HStack {
                Text("Popular Creators")
                    .font(.system(size: 12, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
        }.padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8.0) {
                ForEach( 0..<8, id: \.self ) { num in
                    Spacer()
                        .frame(width: 50, height: 50)
                        .background(Color.gray)
                        .cornerRadius(.infinity)
                        .shadow(color: .gray, radius: 5, x: 0.0, y: 0.2)
                        .padding(.bottom)
                }
            }.padding(.horizontal)
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
