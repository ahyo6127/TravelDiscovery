//
//  TileModifier.swift
//  TravelDiscovery
//
//  Created by Travis on 2024/1/30.
//

import SwiftUI

extension View {
    func asTile() -> some View {
        modifier(TileModifier())
    }
}

struct TileModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(Color("colorForBackground"))
            .cornerRadius(5)
            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 4, x: 0.0, y: 0.2)
    }
}
