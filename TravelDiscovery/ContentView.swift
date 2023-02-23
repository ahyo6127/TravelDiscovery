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

struct DiscoverCatagoriesView: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 8) {
                ForEach( 0..<5, id: \.self) { num in
                    VStack(spacing: 4) {
                        Spacer()
                            .frame(width: 50, height: 50)
                            .background(Color.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray ,radius: 5, x: 0.0, y: 0.2)
                        Text("Art")
                            .font(.system(size: 12, weight: .semibold))
                    }
                }
            }.padding(.horizontal)
    //                .background(Color.blue)
        }
    }
}
