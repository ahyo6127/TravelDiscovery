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
        .init(name: "Sports", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "carrot.fill"),
        .init(name: "History", imageName: "house.lodge.fill"),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 8) {
                ForEach(categories, id: \.self) { category in
                   NavigationLink(
                    destination: CategoryDetailsView(name: category.name),
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

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
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
