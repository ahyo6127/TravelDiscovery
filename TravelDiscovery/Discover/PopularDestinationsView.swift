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
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8.0) {
                    ForEach( destinations, id: \.self ) { destination in
                        NavigationLink (
                        destination: 
                            NavigationLazyView(PopularDestinationDetailsView(destination: destination))
                            ,
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

struct DestinationDetails: Decodable {
    let description: String
    let photos: [String]
}

class DestinationDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var destinationDetails: DestinationDetails?
    
    init(name: String){
        //let make a network call
//        let name = "paris"
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/destination?name=\(name.lowercased())")
        else { return }
        URLSession.shared.dataTask(with: url) { data, resp, err in
            //make sure to check your err & resp
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                
                do {
                    self.destinationDetails = try
                        JSONDecoder().decode(DestinationDetails.self, from: data)
                    
                } catch {
                    print("Failed to decode JSON,", error)
                }
            }
            
        }.resume()
    }
}
    

struct PopularDestinationDetailsView: View {
    
    @ObservedObject var vm: DestinationDetailsViewModel
    
    let destination: Destination
    
    @State var region: MKCoordinateRegion
    @State var isShowingAttractions = true
    
    init(destination: Destination) {
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.08, longitudeDelta: 0.08)))
        
        self.vm = .init(name: destination.name)
    }
    
    let imageUrlStrings = [
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6982cc9d-3104-4a54-98d7-45ee5d117531",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e"
    ]
    
    var body: some View {
        ScrollView {
            
            if let photos = vm.destinationDetails? .photos {
                DestinationHeaderContainer(imageUrlStrings: vm.destinationDetails?.photos ?? [])
                    .frame(width: 350, height: 250)
            }
            
//            Image(destination.imageName)
//                .frame(height: 150)
//                .resizable()
//                    .scaledToFill()
//                    .clipped()
            
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
                
                Text(vm.destinationDetails? .description ?? "")
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
//                MapMarker(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude), tint: .blue)
                MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)) {
                    CustomMapAnnotation(attraction: attraction)
                }
            }
            .frame(height: 300)
            
        }.navigationBarTitle(destination.name, displayMode: .inline)
    }
    
    let attractions: [Attraction] = [
        .init(name: "Taipei101", imageName: "Taipei101", latitude: 25.04841, longitude: 121.53301),
        .init(name: "TaipeiArena", imageName: "TaipeiArena", latitude: 25.050664, longitude: 121.550095),
        .init(name: "TaipeiNightMarket", imageName: "TaipeiNightMarket", latitude: 25.050617, longitude: 121.575145),
    ]
}

struct CustomMapAnnotation: View {
    
    let attraction: Attraction
    
    var body: some View {
        VStack {
            Image(attraction.imageName)
                .resizable()
                .frame(width: 80, height: 60)
                .cornerRadius(3.0)
            Text(attraction.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.vertical, 4)
                .padding(.horizontal, 6)
                .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
//                .border(Color.black)
                .cornerRadius(3.0)
                .overlay(
                     RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
        }.shadow(radius: 5)
    }
}

struct Attraction: Identifiable {
    let id = UUID().uuidString
    
    let name, imageName: String
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
