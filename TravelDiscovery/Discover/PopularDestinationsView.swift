//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/1/29.
//

import SwiftUI
import MapKit

struct PopularDestinationsView: View {
    
    let destinations : [Destination] = [
        .init(name: "Taipei", country: "Taiwan", imageName: "Taipei101", latitude: 25.04841, longitude: 121.53301),
        .init(name: "Tokyo", country: "Japan", imageName: "Tokyo", latitude: 35.68951, longitude: 139.69170),
        .init(name: "New York", country: "United State", imageName: "New_York", latitude: 40.71592,  longitude: -74.0055),
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
    
    @State var region: MKCoordinateRegion
    @State var isShowingAttractions = false
    
    init(destination: Destination) {
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    }
    
    var body: some View {
        ScrollView {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
            
            VStack(alignment: .leading){
                Text(destination.name)
                    .font(.system(size: 16, weight: .bold))
                    .padding(.top, 8)
                Text(destination.country)
                    .font(.system(size: 14))
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top, 2)
                
                Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. ")
                    .padding(.top, 4)
                    .font(.system(size: 14))

                HStack{ Spacer() }
            }//.background(.blue)
            .padding(.horizontal)
            
            HStack {
                Text("Location")
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                
                Button(action: {isShowingAttractions.toggle() }, label: {
                    Text("\(isShowingAttractions ? "Hide" : "Show") Atrractions")
                        .font(.system(size: 14, weight: .semibold))
                })
                
                //UIKit:UISwitch
                Toggle("", isOn: $isShowingAttractions)
                    .labelsHidden()
                
            }
            .padding(.horizontal)
            
            Map(coordinateRegion: $region,  annotationItems: isShowingAttractions ?     attractions : [] ) { attraction in
                MapMarker(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude), tint: .blue)
            }
            .frame(height: 300)
            
        }.navigationBarTitle(destination.name, displayMode: .inline)
    }
    
    let attractions: [Attraction] = [
        .init(name: "Taipei101", latitude: 25.04841, longitude: 121.53301),
        .init(name: "Taipei102", latitude: 25.05841, longitude: 121.54301),
        .init(name: "Taipei103", latitude: 25.03841, longitude: 121.52301),
    ]
}

struct Attraction: Identifiable {
    let id = UUID().uuidString
    
    let name: String
    let latitude, longitude: Double
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
            PopularDestinationDetailsView(destination: .init(name: "Taipei", country: "Taiwan", imageName: "Taipei101", latitude: 25.04841, longitude: 121.53301))
//            PopularDestinationDetailsView(destination: .init(name: "Tokyo", country: "Japan", imageName: "Tokyo", latitude: 35.68951, longitude: 139.69170))
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
