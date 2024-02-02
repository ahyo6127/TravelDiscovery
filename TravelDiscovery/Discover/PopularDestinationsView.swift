//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/1/29.
//

import SwiftUI

struct PopularDestinationsView: View {
    
    let destinations : [Destination] = [
        .init(name: "Taipei", country: "Taiwan", imageName: "Taipei"),
        .init(name: "Tokyo", country: "Japan", imageName: "Tokyo"),
        .init(name: "New York", country: "United State", imageName: "New_York"),
    ]
    
    var body: some View {
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
                        NavigationLink (
                        destination: PopularDestinationDetailsView(destination: destination),
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

struct PopularDestinationDetailsView: View {
    
    let destination: Destination
    
    var body: some View {
        ScrollView {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            
            VStack(alignment: .leading){
                Text(destination.name)
                    .font(.system(size: 16, weight: .bold))
                Text(destination.country)
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top, 2)
                
                Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")
                    .padding(.top, 4)
//                    .lineLimit(100)
//                    .frame(height: 1000)

                
                HStack{ Spacer() }
            }//.background(.blue)
            .padding(.horizontal)
        }.navigationBarTitle(destination.name, displayMode: .inline)
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
//                            .clipped()
                .cornerRadius(4)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)

            Text(destination.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))
            
            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.gray)
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
            
        }
        .asTile()
    }
}
struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationDetailsView(destination: .init(name: "Taipei", country: "Taiwan", imageName: "Taipei"))
        }
         DiscoverView()
         PopularDestinationsView()
    }
}

//#Preview {
  //  PopularDesnationsView()
   // DiscoverView()
    //Text("Hello")
//}
