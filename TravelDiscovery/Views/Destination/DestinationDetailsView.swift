//
//  DestinationDetailsView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/3/3.
//

import SwiftUI
import MapKit

struct DestinationDetails: Decodable {
    let description: String
    let photos: [String]
}

class DestinationDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var destinationDetails: DestinationDetails?
    
    init(name: String){
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/destination?name=\(name.lowercased())")
        else { return }
        URLSession.shared.dataTask(with: url) { data, resp, err in
            
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
            
            if (vm.destinationDetails? .photos) != nil {
                DestinationHeaderContainer(imageUrlStrings: vm.destinationDetails?.photos ?? [])
                    .frame(height: 300)
            }
            
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
                
                HStack {
                    Text(vm.destinationDetails? .description ?? "")
                        .padding(.top, 4)
                        .font(.system(size: 14))
                    Spacer()
                }
                
            }.padding(.horizontal)
            
            HStack {
                Text("Location")
                    .font(.system(size: 18, weight: .semibold))
                
                Spacer()
                
                Button(
                    action: { isShowingAttractions.toggle() },
                    label: {
                        Text("\(isShowingAttractions ? "Hide" : "Show") Atrractions")
                        .font(.system(size: 14, weight: .semibold))
                })
                
                Toggle("", isOn: $isShowingAttractions)
                    .labelsHidden()
                
            }.padding(.horizontal)
            
            
            Map(coordinateRegion: $region, annotationItems: isShowingAttractions ? attractions : [] ) { attraction in
                MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)) {
                    CustomMapAnnotation(attraction: attraction)
                }
            }.frame(height: 300)
            
            
        }.navigationBarTitle(destination.name, displayMode: .inline)
    }
    
    let attractions: [Attraction] = [
        .init(name: "Taipei101", imageName: "Taipei101", latitude: 25.04841, longitude: 121.53301),
        .init(name: "TaipeiArena", imageName: "TaipeiArena", latitude: 25.050664, longitude: 121.550095),
        .init(name: "TaipeiNightMarket", imageName: "TaipeiNightMarket", latitude: 25.050617, longitude: 121.575145),
    ]
}


#Preview {
    PopularDestinationDetailsView(destination: .init(name: "Paris", country: "France", imageName: "Taipei101", latitude: 25.04841, longitude: 121.53301))
}
