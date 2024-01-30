//
//  PopularDesnationsView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/1/29.
//

import SwiftUI

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
                        //.frame(width: 125)
                        .asTile()
                        //.modifier(TileModifier())
                        .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}



struct PopularDesnationsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDesnationsView()
        DiscoverView()
    }
}

//#Preview {
  //  PopularDesnationsView()
   // DiscoverView()
    //Text("Hello")
//}
