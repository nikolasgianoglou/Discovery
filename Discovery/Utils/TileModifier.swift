//
//  TileModifier.swift
//  Discovery
//
//  Created by Nikolas Gianoglou Coelho on 26/10/2023.
//

import SwiftUI

extension View {
    func asTile() -> some View {
        modifier(TileModifier())
    }
}

struct TileModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
    }
}
