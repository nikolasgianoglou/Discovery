//
//  PopularDestinationTile.swift
//  Discovery
//
//  Created by Nikolas Gianoglou Coelho on 09/11/2023.
//

import SwiftUI

struct PopularDestinationTile: View {
    
    let destination: Destination
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(5)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)
            
            Text(destination.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))
            
            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 12)
                .foregroundColor(.gray)
        }
        .asTile()
    }
}

struct PopularDestinationTile_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationTile(destination: .init(name: "Paris",
                                                  country: "France",
                                                  imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
    }
}
