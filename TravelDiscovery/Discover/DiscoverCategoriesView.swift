//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/1/29.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    
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
                   NavigationLink(
                    destination: CategoryDetailsView(),
                    label: {
                        VStack(spacing: 4) {
    //                        Spacer()
                            Image(systemName: category.imageName)
                                .foregroundColor(Color.orange)
                                .frame(width: 64, height: 64)
                                .background(Color.white)
                                .cornerRadius(64)
                                //.shadow(color: .gray ,radius: 4, x: 0.0, y: 2)
                            Text(category.name)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                        }.frame(width: 80)
                    })
                }
            }.padding(.horizontal)
    //                .background(Color.blue)
        }
    }
}

struct Place: Decodable, Hashable {
    let name, thumbnail: String
}

class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Place]()
    
    @Published var errorMessage = ""
    
    init() {
        //network code will happen here
        
        //real network code
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            //you want to check resp statusCode and err
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
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


struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    typealias UIViewType = UIActivityIndicatorView
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}

struct CategoryDetailsView: View {
    
//    @State var isLoading = false
    //Where do i perform my network activity code?
    
    @ObservedObject var vm = CategoryDetailsViewModel()
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack {
                    ActivityIndicatorView()
                    Text("Loading")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color.black)
                .cornerRadius(12)
                
            } else {
                ZStack {
                    Text(vm.errorMessage)
                    ScrollView {
                        ForEach(vm.places, id: \.self) { place in
                            VStack(alignment: .leading, spacing: 0){
                                Image("Museum1")
                                    .resizable()
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
        }.navigationBarTitle("Category", displayMode: .inline)
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailsView()
        }
        DiscoverView()
//        ZStack {
//            Color.orange
//            DiscoverCategoriesView()
//        }
    }
}


//#Preview {
//    DiscoverCategoriesView()
//}

//NavigationView {
//            NavigationLink(
//                destination: Text("Destination"),
//                label: {
//                    Text("Link")
//            })
//        }
