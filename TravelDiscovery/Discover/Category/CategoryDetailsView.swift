//
//  CategoryDetailsView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/2/1.
//

import SwiftUI
import Kingfisher
import SDWebImageSwiftUI

class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Place]()
    
    @Published var errorMessage = ""
    
    init(name: String) {
        //real network code
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: urlString) else {
            self.isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                //you want to check resp statusCode and err
                if let statusCode = (resp as? HTTPURLResponse)?.statusCode,
                   statusCode >= 400 {
                    self.isLoading = false
                    self.errorMessage = "Bad status: \(statusCode)"
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    print("Fail to decode JSON:", error)
                    self.errorMessage = error.localizedDescription
                }
                
                self.isLoading = false
            }
        }.resume() //make sure to have resume
    }
}


struct CategoryDetailsView: View {
    
    private let name: String
    @ObservedObject private var vm: CategoryDetailsViewModel
    
    init(name: String) {
        print("Loaded CategoryDetails View and making a network request for \(name)")
        self.name = name
        self.vm = .init(name: name)
    }
//    let name: String
//    @State var isLoading = false
//    //Where do i perform my network activity code?
//    
//    @ObservedObject var vm = CategoryDetailsViewModel()
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack {
                    ActivityIndicatorView()
                    Text("Loading..")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color.black)
                .cornerRadius(12)
                
            } else {
                ZStack {
                    
                    if !vm.errorMessage.isEmpty {
                        VStack (spacing: 12){
                            Image(systemName: "xmark.square.fill")
                                .font(.system(size: 64, weight: .semibold))
                                .foregroundColor(.red)
                            Text(vm.errorMessage)
                        }
                    }
                    
                    ScrollView {
                        ForEach(vm.places, id: \.self) { place in
                            VStack(alignment: .leading, spacing: 0){
                                //KFImage(URL(string: place.thumbnail)!)
                                WebImage(url: URL(string: place.thumbnail))
                                    .resizable()
                                    .indicator(.activity) // Activity Indicator
                                    .transition(.fade(duration: 0.5)) // Fade Transition with duration
                                    .scaledToFill()
                                Text(place.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding()

                            }.asTile()
                            .padding()
                        }
                    }
                }
                
            }
        }.navigationBarTitle(name, displayMode: .inline)
    }
}

#Preview {
    NavigationView {
        CategoryDetailsView(name: "Live Events")

    }
}
