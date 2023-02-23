//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Travis on 2023/2/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            ScrollView {
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing: 8) {
                        ForEach( 0..<5, id: \.self) { num in
                            VStack(spacing: 4) {
                                Spacer()
                                    .frame(width: 50, height: 50)
                                    .background(Color.gray)
                                    .cornerRadius(.infinity)
                                    .shadow(color: .gray ,radius: 5, x: 0.0, y: 0.2)
                                Text("Art")
                                    .font(.system(size: 12, weight: .semibold))
                            }
                        }
                    }.padding(.horizontal)
                    
                }
//                .background(Color.blue)
            }.navigationTitle("Discover")
        }
        //            Image(systemName: "globe")
        //                .imageScale(.large)
        //                .foregroundColor(.accentColor)
        //            Text("Hello, world!!!")
        //                .padding()
        //                .navigationBarTitle("Inline", displayMode: .inline)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
