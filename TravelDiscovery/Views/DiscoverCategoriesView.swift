//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/1/29.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}


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
            HStack(alignment: .top, spacing: 14) {
                
                ForEach(categories, id: \.self) { category in
                   NavigationLink(
                    destination: NavigationLazyView(CategoryDetailsView(name: category.name)),
                    label: {
                        VStack(spacing: 8) {
                            Image(systemName: category.imageName)
                                .font(.system(size: 20))
                                .foregroundColor(Color.orange)
                                .frame(width: 64, height: 64)
                                .background(Color.white)
                                .cornerRadius(64)
                            Text(category.name)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }.frame(width: 80)
                    })
                }
                
            }.padding(.horizontal)
        }
    }
}


struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
