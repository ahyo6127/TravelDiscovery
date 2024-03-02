//
//  UserDetailsVIew.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/3/2.
//

import SwiftUI
import Kingfisher

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
                    VStack(alignment: .leading) {
                        KFImage(URL(string: "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/4aff5261-6cea-49ad-a541-cb70b7f13ed3"))
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                        
                        HStack {
                            Image("userMan01")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 34)
                                .clipShape(Circle())
                                
                            VStack(alignment: .leading){
                                Text("Here is my post title")
                                    .font(.system(size: 14, weight: .semibold))

                                Text("500k views")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundStyle(Color(.gray))
                            }
                        }.padding(.horizontal, 6)
                        
                        HStack {
                            ForEach(0..<3, id: \.self) { num in
                                Text("#Traveling")
                                    .foregroundStyle(Color(#colorLiteral(red: 0.2, green: 0.6, blue: 0.9, alpha: 1)))
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 4)
                                    .background(Color(#colorLiteral(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)))
                                    .cornerRadius(20)
                            }
                        }.padding(.horizontal, 8)
                        .padding(.bottom, 10)
            
                    }
//                    .frame(height: 250)
                    .background(Color(white: 1))
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
