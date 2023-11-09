//
//  PopularDestinationsView.swift
//  Discovery
//
//  Created by Nikolas Gianoglou Coelho on 25/10/2023.
//

import MapKit
import SwiftUI

struct PopularDestinationsView: View {
    
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.855014, longitude: 2.341231),
        .init(name: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.67988, longitude: 139.7695),
        .init(name: "New York", country: "US", imageName: "new_york", latitude: 40.71592, longitude: -74.0055),
        
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8){
                    ForEach(destinations, id: \.self) { destination in
                        NavigationLink(destination: {
                            PopularDestinationsDetailsView(destination: destination)
                        }, label: {
                            PopularDestinationTile(destination: destination)
//                            .modifier(TileModifier())
                            .padding(.bottom)
                        })
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}





struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationsDetailsView(destination: .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
//            PopularDestinationsDetailsView(destination: .init(name: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.679693, longitude: 139.771913))
        }
        PopularDestinationsView()
        DiscoveryView()
    }
}


