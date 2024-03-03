//
//  TrendingCreatorsView.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/1/29.
//

import SwiftUI

struct TrendingCreatorsView: View {
    
    let users: [User] = [
        .init(id: 0, name: "userMan 01", imageName: "userMan01"),
        .init(id: 1, name: "userMan 02", imageName: "userMan02"),
        .init(id: 2, name: "userMan 03", imageName: "userMan03"),
    ]
    
    var body: some View{
        VStack(spacing: 0) {
            HStack {
                Text("Popular Creators")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 8.0) {
                    ForEach( users, id: \.self ) { user in
                        NavigationLink(destination: NavigationLazyView(UserDetailsView(user: user)), label: {
                            DiscoverUserView(user: user)
                        })
                    }
                    
                }.padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}



struct DiscoverUserView: View {
    
    let user: User
    
    var body: some View {
        VStack {
            Image(user.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .cornerRadius(.infinity)
            Text(user.name)
                .font(.system(size: 12, weight: .semibold))
                .multilineTextAlignment(.center)
        }
        .frame(width: 60)
        .shadow(color: .gray, radius: 4, x: 0.0, y: 0.2)
        .padding(.bottom)
        .padding(.top)
    }
}
struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
//        TrendingCreatorsView()
        DiscoverView()
    }
}

//#Preview {
//    TrendingCreatorsView()
//}
