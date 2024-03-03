//
//  UserDetailsVIew.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/3/2.
//

import SwiftUI
import Kingfisher

struct UserDetails: Decodable {
    let username, firstName, lastName, profileImage: String
    let followers, following: Int
    let posts: [Post]
}

struct Post: Decodable, Hashable {
    let title, imageUrl, views: String
    let hashtags: [String]
}

class UserDetailsViewModel: ObservableObject {
    
    @Published var userDetails: UserDetails?
    
    init(userID: Int) {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/user?id=\(userID)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                
                do {
                    self.userDetails = try JSONDecoder().decode(UserDetails.self, from: data)
                } catch let jsonError {
                    print("Decoding failed for UserDetails:", jsonError)
                }
                print(data)
            }
        
        }.resume()
    }
}

struct UserDetailsView: View {
    
    //setup dummy vm
    @ObservedObject var vm: UserDetailsViewModel
    
    let user: User
    
    init(user: User) {
        self.user = user
        self.vm = .init(userID: user.id)
    }
    
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
                
                Text("\(self.vm.userDetails?.firstName ?? "") \(self.vm.userDetails?.lastName ?? "")")
                    .font(.system(size: 14, weight: .semibold))
                
                HStack {
                    //option+8 •
                    Text("@\(self.vm.userDetails?.username ?? "") •")
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
                        Text("\(self.vm.userDetails?.followers ?? 0)")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Followers")
                            .font(.system(size: 9, weight: .regular))
                    }
                    
                    Spacer()
                        .frame(width: 1, height: 16)
                        .background(Color(.lightGray))
                    
                    VStack {
                        Text("\(self.vm.userDetails?.following ?? 0)")
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
                
                ForEach(vm.userDetails?.posts ?? [], id: \.self) { post in
                    VStack(alignment: .leading) {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                        
                        HStack {
                            Image(user.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 34)
                                .clipShape(Circle())
                                
                            VStack(alignment: .leading){
                                Text(post.title)
                                    .font(.system(size: 14, weight: .semibold))

                                Text("\(post.views) views")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundStyle(Color(.gray))
                            }
                        }.padding(.horizontal, 6)
                        
                        HStack {
                            ForEach(post.hashtags, id: \.self) { hashtag in
                                Text("#\(hashtag)")
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
        UserDetailsView(user: .init(id: 0, name: "Amy Adams", imageName: "userMan01"))
    }
}
