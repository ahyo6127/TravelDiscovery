//
//  UserDetailsVIew.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/3/2.
//

import SwiftUI

struct UserDetailsView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                Image(user.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    .padding(.top)
                
                Text("Amy Adams")
                    .font(.system(size: 14, weight: .semibold))
                
                HStack {
                    //option+8 •
                    Text("@amyadams20 •")
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 10, weight: .semibold))
                    Text("2567")
                }
                .font(.system(size: 12, weight: .regular))

                Text("Youtuber,  Vlogger,  Travel Creator")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color(.lightGray))

                HStack(spacing: 18) {
                    VStack {
                        Text("66,666")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Followers")
                            .font(.system(size: 9, weight: .regular))
                    }
                    
                    Spacer()
                        .frame(width: 1, height: 16)
                        .background(Color(.lightGray))
                    
                    VStack {
                        Text("2,134")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Following")
                            .font(.system(size: 9, weight: .regular))
                    }
                }
                
                HStack(spacing: 12) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Spacer()
                            Text("Follow")
                                .foregroundStyle(Color(.white))
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color.orange)
                        .cornerRadius(100)
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Spacer()
                            Text("Contact")
                                .foregroundStyle(Color(.black))
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color(white: 0.9))
                        .cornerRadius(100)
                    })
                    
                }.font(.system(size: 12, weight: .semibold))
                
                ForEach(0..<10, id: \.self) { num in
                    HStack{
                        Spacer()
                    }
                    .frame(height: 250)
                    .background(Color(white: 0.8))
                    .cornerRadius(8)
                    .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
                }

            }.padding(.horizontal)
            
        }.navigationBarTitle(user.name, displayMode: .inline)
    }
}
#Preview {
    NavigationView {
        UserDetailsView(user: .init(name: "Amy Adams", imageName: "userMan01"))
    }
}
